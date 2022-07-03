import 'package:digi_14/core/utils/navigation/route_argument_classes.dart';
import 'package:digi_14/core/utils/navigation/routes.dart';
import 'package:digi_14/features/events/views/events_home_view.dart';
import 'package:flutter/material.dart';

import '../../../features/events/views/events_details_view.dart';
import '../../presentation/views/error_view.dart';

class AppRouter {
  static generateRoute() {
    return (RouteSettings settings) {
      Widget route = _getRouteWidget(settings);

      return MaterialPageRoute(
        builder: (context) => route,
        settings: settings,
      );
    };
  }

  static _getRouteWidget(RouteSettings settings) {
    switch (settings.name) {
      case Routes.eventsHome:
        return const EventsHomeView();

      case Routes.eventDetails:
        return EventDetailsView(args: settings.arguments as EventDetailsArgs);

      /// [MISC]
      case Routes.error:
        return ErrorView(args: settings.arguments as ErrorViewArgs);
      default:
        return ErrorView(
          args: settings.arguments as ErrorViewArgs,
        );
    }
  }
}
