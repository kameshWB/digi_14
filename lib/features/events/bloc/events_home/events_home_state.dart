part of 'events_home_bloc.dart';

abstract class EventsHomeState extends Equatable {
  const EventsHomeState();

  @override
  List<Object> get props => [];
}

class InitialState extends EventsHomeState {}

class ErrorState extends EventsHomeState {
  final String msg;
  const ErrorState(this.msg);

  @override
  List<Object> get props => [msg];
}

class SearchClickedState extends EventsHomeState {
  const SearchClickedState();

  @override
  List<Object> get props => [];
}
class CrossClickedState extends EventsHomeState {
  const CrossClickedState();

  @override
  List<Object> get props => [];
}

class EventsLoadedState extends EventsHomeState {
  final List<EventModel> events;
  const EventsLoadedState(this.events);

  @override
  List<Object> get props => [events];
}
class SearchResultLoadedEventsState extends EventsHomeState {
  final List<EventModel> events;
  const SearchResultLoadedEventsState(this.events);

  @override
  List<Object> get props => [events];
}
