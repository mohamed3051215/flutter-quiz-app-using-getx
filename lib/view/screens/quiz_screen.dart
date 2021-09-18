import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/quiz_controller.dart';
import 'package:quiz_quiz/core/models/question.dart';
import 'package:quiz_quiz/view/widgets/question_ui.dart';
import 'package:quiz_quiz/view/widgets/wide_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.find<QuizController>();
    return Obx(() => Scaffold(
        body: controller.gotData.value
            ? SafeArea(
                child: Obx(() => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          height: Get.height - 86,
                          child: ListView.builder(
                            itemCount: controller.questions.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Question question =
                                  controller.questions[index];
                              if (question.type != "boolean") {
                                final List<String> answers =
                                    question.incorrectAnswers;
                                answers.add(question.correctAnswer);
                                answers.shuffle();
                                print("answers" + answers.toString());
                                return QuestionWidget(
                                    question: question,
                                    answers: answers,
                                    isBoolean: false,
                                    index: index);
                              }

                              return QuestionWidget(
                                  question: question,
                                  answers: ["True", "False"],
                                  isBoolean: true,
                                  index: index);
                            },
                          ),
                        ),
                        Expanded(
                          child: WideButton(
                              title: "finish", func: controller.showResults),
                        ),
                      ],
                    )),
              )
            : Center(
                child: CircularProgressIndicator(),
              )));
  }
}
