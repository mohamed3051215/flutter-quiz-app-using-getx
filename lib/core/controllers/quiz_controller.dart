import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/result_controller.dart';
import 'package:quiz_quiz/core/models/question.dart';
import 'package:quiz_quiz/core/service/api_service.dart';
import 'package:quiz_quiz/core/service/sqflite_service.dart';
import 'package:quiz_quiz/view/screens/result_screen.dart';

class QuizController extends GetxController {
  final ApiService service = ApiService();
  RxList<Question> questions = <Question>[].obs;
  List _args = [];
  RxBool gotData = false.obs;
  RxList<int> qAnswers = <int>[].obs;
  List<String> answers = [];
  bool valide = true;
  @override
  onInit() async {
    super.onInit();
    _args = Get.arguments;
    qAnswers.value = List.generate(_args[2], (index) {
      return 4;
    });
    answers = List.generate(_args[2], (index) {
      return '';
    });
    printInfo(info: "qAnswer is : $qAnswers");

    questions = (await service.getQuestions(
            number: _args[2], level: _args[0], type: _args[1]))
        .obs;
    List<String> correctAnswers = questions.map<String>((element) {
      return element.correctAnswer;
    }).toList();
    print(correctAnswers);
    gotData.value = true;
  }

  double getResults() {
    qAnswers.forEach((element) {
      if (element == 4) {
        valide = false;
        print(qAnswers);
      }
    });
    if (!valide) {
      Get.snackbar("Wait !!", "You Should Complete The Exam");
      return 1.0;
    }
    List<String> correctAnswers = questions.map<String>((element) {
      return element.correctAnswer;
    }).toList();

    int correctAnswersNumber = 0;
    for (int index = 0; index < answers.length; index++) {
      if (answers[index] == correctAnswers[index]) {
        print("added one ");
        correctAnswersNumber++;
      }
    }
    return (correctAnswersNumber / _args[2]) * 100;
  }

  showResults() async {
    final double result = getResults();
    if (valide) {
      print(valide);
      Get.off(() => ResultScreen(), arguments: result);
      Get.put(ResultController());
      await SqfliteService.insert(result);
    }
    valide = true;
  }
}
