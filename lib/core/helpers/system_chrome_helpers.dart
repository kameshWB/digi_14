import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemChromeHelpers {


  static setLightMode() {
    if(Platform.isAndroid){
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xfff4f7ff),
        statusBarColor: Color(0xfff4f7ff),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    }


  }static setPortraitUp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
