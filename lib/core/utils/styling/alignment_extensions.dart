import 'package:flutter/material.dart';

extension WidgetAlignment on Widget {
  Align get left => Align(
        alignment: Alignment.centerLeft,
        child: this, 
      );
  Align get right => Align(
        alignment: Alignment.centerRight,
        child: this, 
      );
  Align get center => Align(
        alignment: Alignment.center,
        child: this, 
      );
  Align get bottom => Align(
        alignment: Alignment.bottomCenter, 
        child: this, 
      );
}


// following is JUST used to import this file in other files
class ImportHelperAlignmentExtension {}