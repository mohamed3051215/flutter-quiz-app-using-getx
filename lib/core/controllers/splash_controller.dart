import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/get_data_controller.dart';
import 'package:quiz_quiz/core/controllers/record_controller.dart';
import 'package:quiz_quiz/core/service/sqflite_service.dart';
import 'package:quiz_quiz/view/screens/get_data_screen.dart';
import 'package:quiz_quiz/view/screens/records_screen.dart';

class SplashController extends GetxController {
  goQuiz() {
    Get.put(GetDataController());
    Get.to(() => GetDataScreen());
  }

  goRecord() async {
    Get.put(RecordController());
    await Get.find<RecordController>().getData();
    Get.to(() =>RecordsScreen());
  }
}
