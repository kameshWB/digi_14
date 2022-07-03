import 'package:flutter/material.dart';


class Utils {
  static String limitTo(String str, int length) {
    if (str.length <= length) {
      return str;
    } else {
      return str.substring(0, length - 2) + "...";
    }
  }

  static void removeFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
    TextEditingController().clear();
    FocusNode().requestFocus();
  }
}
