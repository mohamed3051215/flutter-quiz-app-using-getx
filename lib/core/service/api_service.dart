import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:quiz_quiz/core/models/question.dart';

class ApiService extends GetConnect {
  //final List<String> levels = ["Easy", "Medium", "Hard", "Anything"];
  // final List<String> types = ["True / False", "Multiple", "Anything"];
  Future<List<Question>> getQuestions(
      {required int number,
      required String level,
      required String type}) async {
    String levelCode =
        level != "Anything" ? "&difficulty=${level.toLowerCase()}" : "";
    String typeCode;
    if (type == "True / False") {
      typeCode = "&type=boolean";
    } else if (type == "Multiple") {
      typeCode = "&type=multiple";
    } else {
      typeCode = "";
    }
    final String link =
        "https://opentdb.com/api.php?amount=$number" + levelCode + typeCode;
    print("Link is ; $link");
    final Response response = await get(link);
    final List data = response.body["results"];
    List<Question> questions = [];
    // print(response.body.toString() + " typeee");
    data.forEach((element) {
      final Question question = Question.fromJson(element);
      questions.add(question);
    });
    print("got Data");
    return questions;
  }
}
