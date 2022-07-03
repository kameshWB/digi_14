import 'package:digi_14/features/events/bloc/events_home/events_home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/locator/locator.dart';

class AppBlocProviders {
  static List<BlocProvider> init() => [
        //! EventsHome
        BlocProvider<EventsHomeBloc>(
          create: (_) => sl<EventsHomeBloc>(),
          lazy: false,
        ),
      ];
}