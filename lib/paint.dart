import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color bgColor;
  RPSCustomPainter({this.bgColor});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0012500, size.height * 0.7980000);
    path_0.cubicTo(
        size.width * 0.1228125,
        size.height * 0.7015000,
        size.width * 0.2065625,
        size.height * 0.7735000,
        size.width * 0.2500000,
        size.height * 0.8000000);
    path_0.cubicTo(
        size.width * 0.3737500,
        size.height * 0.9035000,
        size.width * 0.4362500,
        size.height * 0.8565000,
        size.width * 0.4950000,
        size.height * 0.7980000);
    path_0.cubicTo(
        size.width * 0.6243750,
        size.height * 0.7040000,
        size.width * 0.6918750,
        size.height * 0.7660000,
        size.width * 0.7475000,
        size.height * 0.7980000);
    path_0.quadraticBezierTo(size.width * 0.8765625, size.height * 0.8995000,
        size.width * 0.9987500, size.height * 0.7960000);
    path_0.lineTo(size.width * 0.9962500, size.height * 0.0060000);
    path_0.lineTo(size.width * 0.0062500, size.height * 0.0020000);
    path_0.quadraticBezierTo(size.width * 0.0050000, size.height * 0.2010000,
        size.width * 0.0012500, size.height * 0.7980000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = bgColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0012500, size.height * 0.7980000);
    path_1.cubicTo(
        size.width * 0.1228125,
        size.height * 0.7015000,
        size.width * 0.2065625,
        size.height * 0.7735000,
        size.width * 0.2500000,
        size.height * 0.8000000);
    path_1.cubicTo(
        size.width * 0.3737500,
        size.height * 0.9035000,
        size.width * 0.4362500,
        size.height * 0.8565000,
        size.width * 0.4950000,
        size.height * 0.7980000);
    path_1.cubicTo(
        size.width * 0.6243750,
        size.height * 0.7040000,
        size.width * 0.6918750,
        size.height * 0.7660000,
        size.width * 0.7475000,
        size.height * 0.7980000);
    path_1.quadraticBezierTo(size.width * 0.8765625, size.height * 0.8995000,
        size.width * 0.9987500, size.height * 0.7960000);
    path_1.lineTo(size.width * 0.9962500, size.height * 0.0060000);
    path_1.lineTo(size.width * 0.0062500, size.height * 0.0020000);
    path_1.quadraticBezierTo(size.width * 0.0050000, size.height * 0.2010000,
        size.width * 0.0012500, size.height * 0.7980000);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
