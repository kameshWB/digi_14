import 'package:digi_14/core/errors/errors.dart';
import 'package:digi_14/core/services/connection_info.dart';
import 'package:digi_14/core/services/network_calls.dart';
import 'package:digi_14/features/events/models/event_model.dart';
import 'package:digi_14/features/events/repository/events_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:test/test.dart';

import '../../../mock_helpers.dart';

void main() {
  late EventsRepository eventsRepo;
  late NetworkCalls networkCalls;
  late ConnectionInfo mockConnectionInfo;

  setUp(() {
    mockConnectionInfo = MockConnectionInfo();

    networkCalls = NetworkCallsImpl(
      client: SentryHttpClient(),
      info: mockConnectionInfo,
    );

    eventsRepo = EventsRepositoryImpl(networkCalls: networkCalls);
  });

  group('EventsRepository.getEvents()', () {
    test('getEvents() with active internet connection', () async {
      when(mockConnectionInfo.isConnected).thenAnswer((_) async {
        return true;
      });

      final events = await eventsRepo.getEvents();

      expect(events, isA<List<EventModel>>());
    });

    test('getEvents() with no internet connection', () async {
      when(mockConnectionInfo.isConnected).thenAnswer((_) async {
        return false;
      });

      expect(() => eventsRepo.getEvents(),
          throwsA(isA<InternetConnectionFailure>()));
    });
  });

  group('EventsRepository.searchEvents()', () {
    test('searchEvents() with active internet connection', () async {
      when(mockConnectionInfo.isConnected).thenAnswer((_) async {
        return true;
      });

      final events = await eventsRepo.searchEvents("");

      expect(events, isA<List<EventModel>>());
    });

    test('searchEvents() with no internet connection', () async {
      when(mockConnectionInfo.isConnected).thenAnswer((_) async {
        return false;
      });

      expect(() => eventsRepo.searchEvents(""),
          throwsA(isA<InternetConnectionFailure>()));
    });
  });
}
