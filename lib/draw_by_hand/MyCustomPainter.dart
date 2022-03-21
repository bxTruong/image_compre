import 'package:flutter/material.dart';
import 'package:image_compre/draw_by_hand/drawn_line.dart';
import 'package:collection/collection.dart';

class MyCustomPainter extends CustomPainter {
  List<DrawnLine> listDrawLine = [];
  List<Offset> listTrueDraw = [];

  MyCustomPainter({required this.listDrawLine, required this.listTrueDraw});

  @override
  void paint(Canvas canvas, Size size) {
    // Offset startPoint = Offset(0, 0);
    //
    // Offset endPoint = Offset(size.width, size.height);
    //
    // Paint paint = Paint();
    //
    // canvas.drawLine(startPoint, endPoint, paint);

    // Paint paintMountains = Paint()
    //   ..style = PaintingStyle.fill
    //   ..color = Colors.brown;
    //
    // Path pathMountains = Path();
    // pathMountains.moveTo(0, 250);
    // pathMountains.lineTo(100, 200);
    // pathMountains.lineTo(150, 150);
    // pathMountains.lineTo(200, 50);
    // pathMountains.lineTo(250, 150);
    // pathMountains.lineTo(300, 200);
    // pathMountains.lineTo(size.width, 250);
    // pathMountains.lineTo(0, 250);
    // canvas.drawPath(pathMountains, paintMountains);

    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..color = Colors.black;

    // Path pathHead = Path();
    // pathHead.moveTo(size.width / 2, size.height / 3);
    // pathHead.addOval(Rect.fromCircle(
    //     center: Offset(size.width / 2, size.height / 3), radius: size.width / 6));
    // canvas.drawPath(pathHead, paintHead);

    double x = size.width - 140;
    double y = 270;

    final pathFill2 = Path()
      ..moveTo(x - 20, y)
      ..relativeCubicTo(80, 220, 120, 0, 0, 0);

    //canvas.drawPath(pathFill2, paintStroke);

    final pathFillCircle = Path()
      ..moveTo(x - 20, y)
      ..addOval(Rect.fromCircle(center: Offset(x - 20, y), radius: 5));

    // final pathFillCircle2 = Path()
    //   ..moveTo(x-20+20, y+20)
    //   ..addOval(Rect.fromCircle(center: Offset(x-20+20, y+20), radius: 5));
    // final pathStrokeCircle = Path()
    //   ..moveTo(x+i+20, y+i+20)
    //   ..addOval(Rect.fromCircle(center: Offset(x+i+20, y+i+20), radius: 5));

    //canvas.drawPath(pathFillCircle, paintFill);
    //canvas.drawPath(pathFillCircle2, paintFill);
    // canvas.drawPath(pathStrokeCircle, paintStroke);

    // for (int i = 5; i < 80; i++) {
    //   if(i%5==0) {
    //     for(double j=i*2.7;j<220;j++) {
    //       final pathFillCircle = Path()
    //         ..moveTo((x - 20) + i, y + (i * 2.7))
    //         ..addOval(Rect.fromCircle(
    //             center: Offset((x - 20) + i, y + (i * 2.7)),
    //             radius: 5));
    //       // final pathStrokeCircle = Path()
    //       //   ..moveTo(x+i+20, y+i+20)
    //       //   ..addOval(Rect.fromCircle(center: Offset(x+i+20, y+i+20), radius: 5));
    //
    //       canvas.drawPath(pathFillCircle, paintFill);
    //       // canvas.drawPath(pathStrokeCircle, paintStroke);
    //     }
    //   }
    // }

    print('AAAA ${pathFill2.getBounds()} ');

    //canvas.drawRect(pathFill2.getBounds(), paintFill);

    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < listDrawLine.length; i++) {
      if (listDrawLine[i] == null) continue;
      if (listDrawLine[i].path != null) {
        for (int j = 0; j < listDrawLine[i].path!.length - 1; j++) {
          if (listDrawLine[i].path![j] != null &&
              listDrawLine[i].path![j + 1] != null) {
            paint.color = listDrawLine[i].color!;
            paint.strokeWidth = listDrawLine[i].width!;
            canvas.drawLine(
                listDrawLine[i].path![j], listDrawLine[i].path![j + 1], paint);
          }
        }
      }
    }

    var listCheck = [];
    for (int h = 0; h < listTrueDraw.length; h++) {
      for (int i = 0; i < listDrawLine.length; i++) {
        if (listDrawLine[i].path != null) {
          for (int j = 0; j < listDrawLine[i].path!.length - 1; j++) {
            if (listDrawLine[i].path![j].dx.roundToDouble() <
                    listTrueDraw[h].dx &&
                listDrawLine[i].path![j].dx.roundToDouble() >
                    listTrueDraw[h].dx &&
                listDrawLine[i].path![j].dy.roundToDouble() <=
                    listTrueDraw[h].dy + 10 &&
                listDrawLine[i].path![j].dy.roundToDouble() >=
                    listTrueDraw[h].dy - 10 &&
                listCheck.length < listTrueDraw.length) {
              listCheck.add(1);
            }
          }
        }
      }
    }

    print('ABC ${listCheck.length} ${listTrueDraw.length}');
    if (listCheck.length == listTrueDraw.length - 1) {
      print('ABC');
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
