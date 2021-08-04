import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(String lable);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(10));

    paint.color = Colors.white;
    canvas.drawRRect(rRect, paint);

    paint.color = Colors.green;
    canvas.drawCircle(Offset(15, size.height / 2), 10, paint);

    final textPainter = TextPainter(
        text: TextSpan(
            text: 'Addis Ababa',
            style: TextStyle(fontSize: 12, color: Colors.black)),
        maxLines: 2,
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: size.width - 50);
    textPainter.paint(
        canvas, Offset(30, size.height / 2 - textPainter.size.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
