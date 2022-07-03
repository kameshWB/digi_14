// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digi_14/core/utils/navigation/routes.dart';
import 'package:digi_14/core/utils/styling/app_measurements.dart';
import 'package:digi_14/core/utils/styling/padding_extensions.dart';
import 'package:digi_14/features/events/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

import '../../../core/utils/constants/app_typography.dart';
import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/navigation/route_argument_classes.dart';

class EventSlider extends StatefulWidget {
  final List<EventModel>? events;
  const EventSlider({Key? key, @required this.events}) : super(key: key);

  @override
  State<EventSlider> createState() => _EventSliderState();
}

class _EventSliderState extends State<EventSlider> {
  ScrollController controller = ScrollController();

  double pos = 0;
  double kWidth = 236 + 24.0 + 20;
  Duration animationDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeLeft: (offset) {
        if (pos == kWidth * (widget.events!.length - 1)) return;
        pos += kWidth;
        controller.animateTo(
          pos,
          duration: animationDuration,
          curve: Curves.easeInCubic,
        );
        setState(() {});
      },
      onSwipeRight: (offset) {
        if (pos == 0) return;
        debugPrint(pos.toString());
        pos -= kWidth;
        controller.animateTo(
          pos,
          duration: animationDuration,
          curve: Curves.easeInCubic,
        );

        setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.eventDetails,
              arguments: EventDetailsArgs(widget.events![currentIndex]));
        },
        child: AbsorbPointer(
          child: SizedBox(
            height: 315,
            width: AppMeasures.screenWidth,
            child: widget.events!.length != null
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    itemCount: widget.events!.length + 1,
                    itemBuilder: (_, index) {
                      if (widget.events!.length == index) {
                        return const SizedBox(
                          width: 153.44,
                        );
                      }
                      return buildItem(
                        index,
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(
    int index,
  ) {
    bool isFirst = index == currentIndex;
    String title = widget.events![index].title;
    String image = widget.events![index].performers[0].image;

    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              width: 153.44,
              height: isFirst ? 273 : 244,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x700c243c),
                    blurRadius: 25,
                    offset: Offset(0, 10),
                  ),
                ],
                color: const Color(0xff0d253c),
              ),
              duration: animationDuration,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            height: isFirst ? 273 : 244,
            margin: EdgeInsets.only(right: isFirst ? 0 : 24),
            width: 236,
            duration: animationDuration,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.red,
              gradient: BoxDecorations.sliderGradient,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  image,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: AppTextStyles.categoryTitleStyle,
              ).paddingLtrb(24, 0, 0, 31),
            ),
          ),
        ),
      ],
    ).paddingLeft(20);
  }

  int get currentIndex => pos ~/ kWidth;
}
