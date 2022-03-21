import 'package:flutter/material.dart';
import 'package:image_compre/draw_page.dart';
import 'package:image_compre/simple_animation_page.dart';

import 'draw_by_hand/draw_page2.dart';
import 'draw_test/drawing_page_3.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawPage2(),
    );
  }
}

