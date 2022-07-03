import 'package:flutter/material.dart';
import 'app.dart';
import 'core/services/locator/locator.dart';

Future<void> main() async {
  /// [Dependency injection] using service locator method (GET_IT package)
  await setupLocator();

  runApp(const App());
}

