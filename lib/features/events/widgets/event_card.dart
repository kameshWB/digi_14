import 'package:digi_14/core/utils/styling/alignment_extensions.dart';
import 'package:digi_14/core/utils/styling/app_measurements.dart';
import 'package:digi_14/core/utils/styling/padding_extensions.dart';
import 'package:digi_14/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/presentation/widgets/app_image.dart';
import '../../../core/utils/constants/app_typography.dart';
import '../../../core/utils/styling/spacing_widgets.dart';
import '../models/event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard(
    this.event, {
    this.isMini = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final EventModel event;
  final Function onTap;
  final bool isMini;
  @override
  Widget build(BuildContext context) {
    if (isMini) {
      return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: AppMeasures.screenWidth,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0f5182ff),
                blurRadius: 15,
                offset: Offset(0, 10),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              Spacing.w5,
              AppImage(
                event.performers[0].image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                borderRadius: 10,
              ).center,
              Spacing.w20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.h5,
                  SizedBox(
                    width: 200,
                    child: Text(
                      Utils.limitTo(
                        event.shortTitle,
                        50,
                      ),
                      style: AppTextStyles.eventCardTitleStyle,
                    ),
                  ),
                ],
              ).paddingSymmetric(0, 10),
            ],
          ),
        ).paddingSymmetric(10, 0),
      );
    }

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: AppMeasures.screenWidth,
        height: 141,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f5182ff),
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            AppImage(
              event.performers[0].image,
              width: 90,
              height: 141,
              fit: BoxFit.cover,
              borderRadius: 16,
            ),
            Spacing.w20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.venue.displayLocation,
                  style: AppTextStyles.eventCardLocationStyle,
                ),
                Spacing.h5,
                SizedBox(
                  width: AppMeasures.screenWidth-30 - AppMeasures.pageMargin*2 -90,
                  child: Text(
                    event.shortTitle,
                    style: AppTextStyles.eventCardTitleStyle,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      Spacing.w6,
                      Text(
                        DateFormat('MMM dd, yyyy').format(event.datetimeLocal),
                        style: AppTextStyles.eventCardDateStyle,
                      ),
                    ],
                  ),
                )
              ],
            ).paddingSymmetric(0, 10),
          ],
        ),
      ).paddingSymmetric(AppMeasures.pageMargin),
    );
  }
}
