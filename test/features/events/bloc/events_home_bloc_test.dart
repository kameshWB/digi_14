import 'package:bloc_test/bloc_test.dart';
import 'package:digi_14/core/errors/errors.dart';
import 'package:digi_14/features/events/bloc/events_home/events_home_bloc.dart';
import 'package:digi_14/features/events/models/event_model.dart';
import 'package:digi_14/features/events/repository/events_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../mock_models.dart';
import '../../../mock_repositories.dart';

void main() {
  late EventsRepository eventsMockRepo;
  late EventModel event;

  setUp(() {
    eventsMockRepo = MockEventRepository();
    event = MockEventModel();
  });

  group("EventsHomeBloc with GetDataEvent added", () {
    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with GetDataEvent added',
      build: () {
        when(() => eventsMockRepo.getEvents()).thenAnswer((inv) async {
          return [event, event];
        });

        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(
        const GetDataEvent(),
      ),
      expect: () => <EventsHomeState>[
        EventsLoadedState([event, event]),
      ],
    );

    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with GetDataEvent added with No Internet',
      build: () {
        when(() => eventsMockRepo.getEvents())
            .thenThrow(const InternetConnectionFailure());

        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(
        const GetDataEvent(),
      ),
      expect: () => <EventsHomeState>[
        const ErrorState(
          "Device is not connected to internet, Please connect to internet",
        ),
      ],
    );

    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with GetDataEvent added with Failure',
      build: () {
        when(() => eventsMockRepo.getEvents())
            .thenThrow(const Failure("Failed for some reason"));

        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(
        const GetDataEvent(),
      ),
      expect: () => <EventsHomeState>[
        const ErrorState(
          "Something went wrong, Please try again later",
        ),
      ],
    );
  });

  group("EventsHomeBloc with SearchQueryUpdatedEvent added", () {
    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with SearchQueryUpdatedEvent added',
      build: () {
        when(() => eventsMockRepo.searchEvents("")).thenAnswer((inv) async {
          return [event, event];
        });

        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(
        const SearchQueryUpdatedEvent(""),
      ),
      expect: () => <EventsHomeState>[
        SearchResultLoadedEventsState([event, event]),
        InitialState(),
      ],
    );

    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with SearchQueryUpdatedEvent added with No Internet',
      build: () {
        when(() => eventsMockRepo.searchEvents(""))
            .thenThrow(const InternetConnectionFailure());

        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(
        const SearchQueryUpdatedEvent(""),
      ),
      expect: () => <EventsHomeState>[
        const ErrorState(
          "Device is not connected to internet, Please connect to internet",
        ),
      ],
    );

    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with SearchQueryUpdatedEvent added with Failure',
      build: () {
        when(() => eventsMockRepo.searchEvents(""))
            .thenThrow(const Failure("Failed for some reason"));

        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(
        const SearchQueryUpdatedEvent(""),
      ),
      expect: () => <EventsHomeState>[
        const ErrorState(
          "Something went wrong, Please try again later",
        ),
      ],
    );
  });

  group("EventsHomeBloc with SearchClickedEvent added", () {
    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with SearchClickedEvent added',
      build: () {
        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(const SearchClickedEvent()),
      expect: () => <EventsHomeState>[
        const SearchClickedState(),
      ],
    );
  });

  group("EventsHomeBloc with CrossClickedEvent added", () {
    blocTest<EventsHomeBloc, EventsHomeState>(
      'when EventsHomeBloc with CrossClickedEvent added',
      build: () {
        return EventsHomeBloc(
          eventRepo: eventsMockRepo,
        );
      },
      act: (bloc) => bloc.add(const CrossClickedEvent()),
      expect: () => <EventsHomeState>[
        const CrossClickedState(),
      ],
    );
  });
}
