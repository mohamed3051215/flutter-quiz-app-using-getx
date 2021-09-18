import 'package:quiz_quiz/core/utils/html_converter.dart';

class Question {
  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });
  late final String category;
  late final String type;
  late final String difficulty;
  late final String question;
  late final String correctAnswer;
  late final List<String> incorrectAnswers;

  Question.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = convert(json['question']);
    correctAnswer = convert(json['correct_answer']);
    incorrectAnswers =
        List.castFrom<dynamic, String>(json['incorrect_answers']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['type'] = type;
    _data['difficulty'] = difficulty;
    _data['question'] = question;
    _data['correct_answer'] = correctAnswer;
    _data['incorrect_answers'] = incorrectAnswers;
    return _data;
  }
}
