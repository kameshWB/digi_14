import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static const String monteserrat = 'Monteserrat';
  static const String avenirHeavy = "Avenir-Heavy";
  static const String avenirBook = "Avenir-Book";
  static const String avenirRoman = "Avenir-Roman";
  static const String avenirMedium = "Avenir-Medium";
  static const String avenirMediumOblique = "Avenir-Medium-Oblique";
  static const String avenirRegular = "Avenir-Regular";
  static const String avenirExtraBold = "Avenir-Extra-Bold";
  static const String avenirLight = "Avenir-Light";
  static const String avenirBold = "Avenir-Bold";
  static const String interMedium = "Inter-Medium";
}

class AppTextStyles {
  static TextStyle get eventCardTitleStyle => const TextStyle(
    color: Color(0xff0d253c),
    fontSize: 15,
    fontFamily: AppFonts.avenirHeavy,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get h1 => const TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.avenirMediumOblique,
    color: Color.fromRGBO(13, 37, 60, 1),
    fontWeight: FontWeight.w800,
  );
  static TextStyle get bodyStyle => const TextStyle(
    color: Color(0xff2d4379),
    fontFamily: AppFonts.avenirRoman,
    fontSize: 14,
  );
  static TextStyle get eventCardLocationStyle => const TextStyle(
    color: Color(0xff376aed),
    fontSize: 10,
    fontFamily: AppFonts.avenirHeavy,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get categoryTitleStyle => const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: AppFonts.avenirHeavy,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get eventCardDateStyle => const TextStyle(
    color: Color(0xff2d4379),
    fontSize: 12,
    fontFamily: AppFonts.avenirMedium,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get pageTitleStyle => TextStyle(
    color: const Color(0xff0d503c),
    fontSize: 24.sp,
    fontFamily: AppFonts.avenirHeavy,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get searchTextStyle => TextStyle(
    color: const Color.fromRGBO(45, 67, 121, 1),
    fontSize: 13.sp,
    fontFamily: AppFonts.avenirLight,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get welcomeTextStyle => TextStyle(
    color: const Color(0xff2d4379),
    fontSize: 17.sp,
    fontFamily: AppFonts.avenirHeavy,
    fontWeight: FontWeight.w300,
  );
}