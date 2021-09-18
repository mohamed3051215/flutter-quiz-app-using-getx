import 'package:get/instance_manager.dart';
import 'package:quiz_quiz/core/controllers/quiz_controller.dart';
import 'package:quiz_quiz/core/controllers/splash_controller.dart';
import 'package:quiz_quiz/view/screens/splash_screen.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
