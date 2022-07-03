import 'package:flutter/material.dart';

import '../../../features/events/models/event_model.dart';

class ErrorViewArgs {
  final VoidCallback callback;
  final String message;

  ErrorViewArgs({
    required this.callback,
    required this.message,
  });
}

class EventDetailsArgs {
  final EventModel event;

  EventDetailsArgs(
    this.event,
  );
}
