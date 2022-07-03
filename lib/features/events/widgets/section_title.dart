import 'package:digi_14/core/utils/styling/alignment_extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_typography.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, @required this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: const TextStyle(
        color: Color(0xff0d253c),
        fontSize: 20,
        fontFamily: AppFonts.avenirHeavy,
        fontWeight: FontWeight.w800,
      ),
    ).left;
  }
}
