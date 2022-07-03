import 'package:digi_14/features/events/bloc/events_home/events_home_bloc.dart';
import 'package:digi_14/features/events/repository/events_repository.dart';

import 'locator.dart';

setupEvents() {
  sl.registerFactory(
    () => EventsHomeBloc(eventRepo: sl()),
  );

  sl.registerLazySingleton<EventsRepository>(
      () => EventsRepositoryImpl(networkCalls: sl()));
}
