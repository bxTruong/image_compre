import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PainterLevel280 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 10
      ..color = Colors.white;
    Paint paintTransperent = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 10
      ..color = Colors.transparent;

    double x = 80;

    while(x<240) {
      canvas.drawLine(Offset(x, 370), Offset(x + 10, 370), paintFill);
      x = x + 20;
    }

    // canvas.drawLine(Offset(80, 370), Offset(90, 370), paintFill);
    // canvas.drawLine(
    //     Offset(80 + (8 * 5), 370), Offset(80 + (8 * 20), 370), paintFill);

    //_drawDashedLine(canvas,size,paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    // Chage to your preferred size
    const int dashWidth = 4;
    const int dashSpace = 4;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double y = 10;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (startX < size.width) {
      // Draw a small line.
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
  }
}
