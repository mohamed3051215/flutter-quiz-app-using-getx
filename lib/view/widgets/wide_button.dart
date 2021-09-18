import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WideButton extends StatelessWidget {
  const WideButton({Key? key, required this.title, required this.func})
      : super(key: key);
  final String title;
  final Function func;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 56,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            onPressed: () => func(),
            child:
                Text(title, style: TextStyle(fontSize: 17, letterSpacing: 1))));
  }
}
