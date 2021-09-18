import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/quiz_controller.dart';
import 'package:quiz_quiz/view/screens/quiz_screen.dart';

class GetDataController extends GetxController {
  RxDouble numbers = 20.0.obs;
  RxInt levelIndex = 3.obs;
  RxInt typeIndex = 2.obs;
  final List<String> levels = ["Easy", "Medium", "Hard", "Anything"];
  final List<String> types = ["True / False", "Multiple", "Anything"];
  void setNumbers(double? value) {
    numbers.value = value!;
  }

  void startQuiz() {
    Get.off(() => QuizScreen(), arguments: [
      levels[levelIndex.value],
      types[typeIndex.value],
      numbers.value.toInt()
    ]);
    Get.put(QuizController());
  }
}
