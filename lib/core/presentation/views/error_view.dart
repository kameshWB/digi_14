import 'package:digi_14/core/presentation/widgets/app_image.dart';
import 'package:digi_14/core/utils/styling/alignment_extensions.dart';
import 'package:digi_14/core/utils/styling/padding_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_typography.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/constants.dart';
import '../../utils/navigation/route_argument_classes.dart';
import '../../utils/styling/app_measurements.dart';
import '../../utils/styling/spacing_widgets.dart';

class ErrorView extends StatelessWidget {
  final ErrorViewArgs args;
  const ErrorView({Key? key, required this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppMeasures.screenHeight,
        width: AppMeasures.screenWidth,
        decoration: BoxDecorations.scaffoldBackground,
        child: Column(
          children: [
            buildAppBar(context),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Error",
                    style: AppTextStyles.pageTitleStyle,
                  ),
                  Spacing.h12,
                  Text(
                    args.message,
                    style: AppTextStyles.bodyStyle,
                    textAlign: TextAlign.center,
                  ).center,
                ],
              ),
            ),
            Spacing.h100,
          ],
        ),
      ),
    );
  }

  Container buildAppBar(BuildContext context) {
    return Container(
      width: AppMeasures.screenWidth,
      height: 116,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            Color(0x00f9faff),
            Color(0xfffafbff),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          args.callback();
        },
        child: AppImage(
          AppImages.icons.backArrow,
          height: 25,
          width: 25,
        ).left.paddingLeft(20),
      ),
    );
  }
}
