import 'dart:async';
import 'package:digi_14/core/services/api.dart';
import 'package:digi_14/core/services/network_calls.dart';
import '../models/event_model.dart';

abstract class EventsRepository {
  Future<List<EventModel>> getEvents();
  Future<List<EventModel>> searchEvents(String query);
}

class EventsRepositoryImpl implements EventsRepository {
  final NetworkCalls networkCalls;

  EventsRepositoryImpl({
    required this.networkCalls,
  });

  @override
  Future<List<EventModel>> getEvents() async {
    try {
      final response = await networkCalls.get(APIs.events);
      GetEventsResponse getEventsResponse =
          GetEventsResponse.fromJson(response);
      return getEventsResponse.events;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventModel>> searchEvents(String query) async {
    try {
      final response = await networkCalls.get(APIs.searchEvent(query));
      GetEventsResponse getEventsResponse =
          GetEventsResponse.fromJson(response);
      return getEventsResponse.events;
    } catch (e) {
      rethrow;
    }
  }
}
