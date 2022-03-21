import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_compre/draw_by_hand/MyCustomPainter.dart';
import 'package:image_compre/draw_level280/painter_level280.dart';

import 'drawn_line.dart';

class DrawPage2 extends StatefulWidget {
  @override
  _DrawPage2 createState() => _DrawPage2();
}

class _DrawPage2 extends State<DrawPage2> {
  DrawnLine line = DrawnLine();
  List<DrawnLine> lines = [];

  StreamController<List<DrawnLine>> linesStreamController =
      StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController =
      StreamController<DrawnLine>.broadcast();

  GlobalKey globalKey =GlobalKey();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Center(child: buildImageFail()),
          //Center(child: buildImageHint()),
          Center(child: buildImageSuccess()),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: PainterLevel280(),
            ),
          ),
          buildAllPath(),
          buildCurrentPath(),
        ],
      ),
    );
  }

  Widget buildImageSuccess() {
    return Image.asset('assets/image/3.jpg');
  }

  Widget buildImageFail() {
    return Image.asset('assets/image/2.jpg');
  }

  Widget buildImageHint() {
    return Image.asset('assets/image/1.jpg');
  }

  Widget buildCurrentPath() {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<DrawnLine>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                key: globalKey,
                painter: MyCustomPainter(listDrawLine: [
                  line
                ], listTrueDraw: [
                  Offset(80, 370),
                  Offset(100, 370),
                  Offset(120, 370),
                  Offset(140, 370),
                  Offset(160, 370),
                  Offset(180, 370),
                  Offset(200, 370),
                  Offset(220, 370),
                  Offset(240, 370),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAllPath() {
    return RepaintBoundary(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<List<DrawnLine>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: MyCustomPainter(listDrawLine: lines, listTrueDraw: [
                Offset(80, 370),
                Offset(100, 370),
                Offset(120, 370),
                Offset(140, 370),
                Offset(160, 370),
                Offset(180, 370),
                Offset(200, 370),
                Offset(220, 370),
                Offset(240, 370),
              ]),
            );
          },
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    log('Start drawing');
    RenderBox? box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    line = DrawnLine(
      path: [point],
      color: Colors.black,
      width: 1,
    );

    //log('$point');
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.path!)..add(point);
    line = DrawnLine(path: path, color: Colors.black, width: 1);
    currentLineStreamController.add(line);

    log('$point');
  }

  void onPanEnd(DragEndDetails details) {
    lines = List.from(lines)..add(line);

    linesStreamController.add(lines);
  }


}
