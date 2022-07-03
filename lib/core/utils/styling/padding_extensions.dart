import 'package:flutter/material.dart';

extension WidgetsPadding on Widget {
  Widget paddingHorizontal([double padding = 8]) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );
  Widget paddingVertical([double padding = 8]) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );
  Widget paddingSymmetric([
    double h = 8,
    double v = 8,
  ]) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
        child: this,
      );
  Widget paddingTop([double padding = 8]) => Padding(
        padding: EdgeInsets.only(top: padding),
        child: this,
      );
  Widget paddingLeft([double padding = 8]) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: this,
      );
  Widget paddingRight([double padding = 8]) => Padding(
        padding: EdgeInsets.only(right: padding),
        child: this,
      );
  Widget paddingBottom([double padding = 8]) => Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );

  Widget paddingAll([double padding = 8]) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget paddingLtrb([
    double l = 8,
    double t = 8,
    double r = 8,
    double b = 8,
  ]) =>
      Padding(
        padding: EdgeInsets.fromLTRB(l, t, r, b),
        child: this,
      );


}


// following is JUST used to import this file in other files
class ImportHelperPaddingExtension {}