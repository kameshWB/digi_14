import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../connection_info.dart';
import '../network_calls.dart';
import 'locator.dart';

setupExternal() async {

  sl.registerLazySingleton(() => SentryHttpClient());

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));

  sl.registerLazySingleton<NetworkCalls>(
      () => NetworkCallsImpl(client: sl(), info: sl(),));
}
