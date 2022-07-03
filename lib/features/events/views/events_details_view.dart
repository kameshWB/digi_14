import 'package:digi_14/core/utils/navigation/route_argument_classes.dart';
import 'package:digi_14/core/utils/styling/alignment_extensions.dart';
import 'package:digi_14/core/utils/styling/app_measurements.dart';
import 'package:digi_14/core/utils/styling/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/presentation/widgets/app_image.dart';
import '../../../core/utils/constants/assets.dart';
import '../../../core/utils/styling/spacing_widgets.dart';

class EventDetailsView extends StatelessWidget {
  final EventDetailsArgs args;

  const EventDetailsView({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 250,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                          child: AppImage(
                            args.event.performers[0].image,
                            // "https://blog.manawa.com/wp-content/uploads/2020/04/Diving-Marco-assmann-Large-1440x980.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  )
                ];
              },
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacing.h12,
                  buildTitle(),
                  buildLocation(),
                ],
              ),
            ),
          ),
          buildAppBar(context),
        ],
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
        },
        child: AppImage(
          AppImages.icons.backArrow,
          height: 25,
          width: 25,
        ).left.paddingLeft(20),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      args.event.title,
      style: const TextStyle(
        color: Color(0xff0d253c),
        fontSize: 25,
        fontFamily: "Avenir-Heavy",
        fontWeight: FontWeight.w800,
      ),
    ).paddingSymmetric(AppMeasures.pageMargin);
  }

  Widget buildLocation() {
    return Text(
      args.event.venue.displayLocation,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: "Avenir-Heavy",
        color: Color.fromRGBO(13, 37, 60, 0.6),
        fontWeight: FontWeight.w800,
      ),
    ).left.paddingSymmetric(AppMeasures.pageMargin + 10);
  }
}
