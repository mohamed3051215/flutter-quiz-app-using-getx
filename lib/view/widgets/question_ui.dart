import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/constatnts/question_type.dart';
import 'package:quiz_quiz/core/controllers/quiz_controller.dart';
import 'package:quiz_quiz/core/models/question.dart';
import 'package:quiz_quiz/core/utils/html_converter.dart';
import 'package:quiz_quiz/view/widgets/selectable_container.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.answers,
      required this.index,
      required this.isBoolean})
      : super(key: key);
  final Question question;
  final List<String> answers;
  final int index;
  final bool isBoolean;
  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.find<QuizController>();
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: Get.width - 40,
              child: Text(
                question.question,
                style: TextStyle(fontSize: 22),
                maxLines: 5,
              ),
            ),
          ],
        ),
        Container(
          height:
              isBoolean ? (4 * 20 + 4 * 56 + 30) / 2 : (4 * 20 + 4 * 56 + 30),
          width: Get.width,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: isBoolean ? 2 : 4,
            itemBuilder: (BuildContext context, int indx) {
              return Obx(() => InkWell(
                    onTap: () {
                      controller.qAnswers[index] = indx;
                      controller.answers[index] = answers[indx];
                    },
                    child: SelectableContainer(
                        title: convert(answers[indx]),
                        isActive: controller.qAnswers[index] == indx),
                  ));
            },
          ),
        )
      ],
    );
  }
}
