import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/get_data_controller.dart';
import 'package:quiz_quiz/view/widgets/selectable_container.dart';
import 'package:quiz_quiz/view/widgets/wide_button.dart';

class GetDataScreen extends StatelessWidget {
  const GetDataScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GetDataController controller = Get.find<GetDataController>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Get.height - 79,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Choose The Level : ",
                              style: TextStyle(fontSize: 22)),
                        ],
                      ),
                      Container(
                        height: 4 * 20 + 4 * 56 + 30,
                        width: Get.width,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.levels.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() => InkWell(
                                    onTap: () {
                                      controller.levelIndex.value = index;
                                    },
                                    child: SelectableContainer(
                                        title: controller.levels[index],
                                        isActive: controller.levelIndex.value ==
                                            index),
                                  ));
                            }),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Choose The Type : ",
                              style: TextStyle(fontSize: 22)),
                        ],
                      ),
                      Container(
                        height: 3 * 20 + 3 * 56 + 30,
                        width: Get.width,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.types.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() => InkWell(
                                    onTap: () {
                                      controller.typeIndex.value = index;
                                    },
                                    child: SelectableContainer(
                                        title: controller.types[index],
                                        isActive: controller.typeIndex.value ==
                                            index),
                                  ));
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("Number of questions : ",
                          style: TextStyle(fontSize: 22)),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: .000001,
                    ),
                    child: Obx(() => Slider(
                          value: controller.numbers.value.toDouble(),
                          activeColor: Colors.red,
                          onChanged: controller.setNumbers,
                          min: 10,
                          max: 50,
                          divisions: 40,
                          label: "${controller.numbers.value.toInt()} question",
                        )),
                  ),
                ],
              ),
            ),
          ),
          WideButton(title: "Start Quiz", func: controller.startQuiz),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}


//  Obx(() => InkWell(
//                             onTap: () {
//                               controller.levelIndex.value = 0;
//                             },
//                             child: SelectableContainer(
//                                 title: "Easy",
//                                 isActive: controller.levelIndex.value == 0),
//                           )),
//                       Obx(() => InkWell(
//                             onTap: () {
//                               controller.levelIndex.value = 1;
//                             },
//                             child: SelectableContainer(
//                                 title: "Medium",
//                                 isActive: controller.levelIndex.value == 1),
//                           )),
//                       Obx(() => InkWell(
//                             onTap: () {
//                               controller.levelIndex.value = 2;
//                             },
//                             child: SelectableContainer(
//                                 title: "Hard",
//                                 isActive: controller.levelIndex.value == 2),
//                           )),
//                       Obx(() => InkWell(
//                             onTap: () {
//                               controller.levelIndex.value = 3;
//                             },
//                             child: SelectableContainer(
//                                 title: "Anything",
//                                 isActive: controller.levelIndex.value == 3),
//                           )),