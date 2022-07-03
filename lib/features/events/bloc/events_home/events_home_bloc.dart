import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digi_14/core/errors/errors.dart';
import 'package:equatable/equatable.dart';

import '../../models/event_model.dart';
import '../../repository/events_repository.dart';

part 'events_home_event.dart';
part 'events_home_state.dart';

class EventsHomeBloc extends Bloc<EventsHomeEvent, EventsHomeState> {
  final EventsRepository eventRepo;

  EventsHomeBloc({required this.eventRepo}) : super(InitialState()) {
    on<GetDataEvent>(_onGetData);
    on<SearchQueryUpdatedEvent>(_onQueryUpdated);

    on<SearchClickedEvent>((
      SearchClickedEvent event,
      Emitter<EventsHomeState> emit,
    ) {
      emit(const SearchClickedState());
    });

    on<CrossClickedEvent>((
      CrossClickedEvent event,
      Emitter<EventsHomeState> emit,
    ) {
      emit(const CrossClickedState());
    });
  }

  void _onGetData(GetDataEvent event, Emitter<EventsHomeState> emit) async {
    try {
      List<EventModel> events = await eventRepo.getEvents();
      emit(EventsLoadedState(events));
    } catch (exception) {
      log(exception.toString());
      if (exception is InternetConnectionFailure) {
        emit(const ErrorState(
          "Device is not connected to internet, Please connect to internet",
        ));
      } else {
        emit(const ErrorState(
          "Something went wrong, Please try again later",
        ));
      }
    }
  }

  void _onQueryUpdated(
      SearchQueryUpdatedEvent event, Emitter<EventsHomeState> emit) async {
    try {
      List<EventModel> events = await eventRepo.searchEvents(event.query);
      emit(SearchResultLoadedEventsState(events));
      emit(InitialState());
    } catch (exception) {
      log(exception.toString());
      if (exception is InternetConnectionFailure) {
        emit(const ErrorState(
          "Device is not connected to internet, Please connect to internet",
        ));
      } else {
        emit(const ErrorState(
          "Something went wrong, Please try again later",
        ));
      }
    }
  }
}
