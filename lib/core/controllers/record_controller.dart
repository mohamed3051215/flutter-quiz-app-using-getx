import 'package:get/get.dart';
import 'package:quiz_quiz/core/service/sqflite_service.dart';

class RecordController extends GetxController {
  RxList<Map<String, dynamic>>? data;
  RxBool gotData = false.obs;
  onInit() async {
    super.onInit();
    await getData();
  }

  Future<List<Map<String, dynamic>>> getData() async {
    data = (await SqfliteService.getData()).obs;
    gotData.value = true;
    return await SqfliteService.getData();
  }
}
