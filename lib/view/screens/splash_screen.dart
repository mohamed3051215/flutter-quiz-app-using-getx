import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/splash_controller.dart';
import 'package:quiz_quiz/view/widgets/wide_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/quiz.png"),
          WideButton(
              title: "Start Quiz", func: Get.find<SplashController>().goQuiz),
          SizedBox(height: 20),
          WideButton(title: "Check My Records", func: Get.find<SplashController>().goRecord),
        ],
      ),
    ));
  }
}
