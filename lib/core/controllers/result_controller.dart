import 'package:get/get.dart';

class ResultController extends GetxController {
  final double result = Get.arguments;
  get intr {
    return "%" + result.toInt().toString();
  }
}
