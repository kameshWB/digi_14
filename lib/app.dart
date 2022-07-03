import 'package:digi_14/core/helpers/system_chrome_helpers.dart';
import 'package:flutter/material.dart';
import 'bloc_providers.dart';
import 'core/utils/navigation/app_router.dart';
import 'features/events/views/events_home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChromeHelpers.setLightMode();
    return MultiBlocProvider(
      providers: AppBlocProviders.init(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => MaterialApp(
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                  boldText: false,
                ),
                child: child!);
          },
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale("en"),
          ],
          home: const EventsHomeView(),
          onGenerateRoute: AppRouter.generateRoute(),
        ),
      ),
    );
  }
}
