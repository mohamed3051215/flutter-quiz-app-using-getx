import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_quiz/core/controllers/result_controller.dart';
import 'package:quiz_quiz/view/screens/splash_screen.dart';
import 'package:quiz_quiz/view/widgets/result_painter.dart';
import 'package:quiz_quiz/view/widgets/wide_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultController controller = Get.find<ResultController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: ResultPainter(),
                child: Center(
                    child: Text(
                  controller.intr.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 30),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: WideButton(
                title: "Go Home",
                func: () {
                  Get.offAll(() => SplashScreen());
                }),
          )
        ],
      ),
    );
  }
}
