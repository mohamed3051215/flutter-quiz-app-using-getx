import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/record_controller.dart';
import 'package:quiz_quiz/core/controllers/result_controller.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecordController controller = Get.find<RecordController>();
    return Obx(() => Scaffold(
        body: controller.gotData.value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: controller.data!.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text("This is Your History : ",
                                  style: TextStyle(fontSize: 22)),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: controller.data!.map<Widget>((element) {
                                return ListTile(
                                  title: Center(
                                      child: Text(element["result"],
                                          style: TextStyle(fontSize: 24))),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      )
                    : Center(child: Text("You Have No Records Untill Now")),
              )
            : Center(
                child: CircularProgressIndicator(),
              )));
  }
}
