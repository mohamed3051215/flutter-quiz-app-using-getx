import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectableContainer extends StatelessWidget {
  const SelectableContainer(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: Get.width,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? Colors.red : Colors.white,
            border: Border.all(color: Colors.black, width: .3)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.red, fontSize: 18),
        )),
      ),
    );
  }
}
