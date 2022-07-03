import 'package:flutter/material.dart';

class BoxDecorations {
  static const scaffoldBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.white, Color(0xfff4f7ff)],
    ),
  );

  static const sliderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x000d253c), Color(0xff0d253c)],
  );
}
