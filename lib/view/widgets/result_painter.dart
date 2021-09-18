import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        90,
        Paint()
          ..color = Colors.red
          ..shader =
              LinearGradient(colors: [Colors.red, Colors.green, Colors.blue])
                  .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 30);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
