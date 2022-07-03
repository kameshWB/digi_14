import 'package:get_it/get_it.dart';
import 'core_locator.dart';
import 'external_locator.dart';
import 'features_locator.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  //! Core
  await setupCore();

  //! External
  await setupExternal();

  //! Features
  setupEvents();
}
