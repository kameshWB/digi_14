part of 'events_home_bloc.dart';

abstract class EventsHomeEvent extends Equatable {
  const EventsHomeEvent();

  @override
  List<Object> get props => [];
}

class EventsHomeHadAddedFeedback extends EventsHomeEvent {
  final String classType;
  final String classGuid;

  const EventsHomeHadAddedFeedback({
    required this.classType,
    required this.classGuid,
  });

  @override
  List<Object> get props => [classGuid, classType];
}

class GetDataEvent extends EventsHomeEvent {
  const GetDataEvent();

  @override
  List<Object> get props => [];
}

class SearchClickedEvent extends EventsHomeEvent {
  const SearchClickedEvent();

  @override
  List<Object> get props => [];
}

class CrossClickedEvent extends EventsHomeEvent {
  const CrossClickedEvent();

  @override
  List<Object> get props => [];
}

class CrossIconClickedEvent extends EventsHomeEvent {
  const CrossIconClickedEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryUpdatedEvent extends EventsHomeEvent {
  final String query;
  const SearchQueryUpdatedEvent(this.query,);

  @override
  List<Object> get props => [query];
}
