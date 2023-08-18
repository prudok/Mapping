import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapping/config/config.dart';
import 'package:mapping/firebase_options.dart';

/// detailed initialization function can be custom configurable
Future<void>? _$initializeApp;

/// Initialization process running all dependencies. Rethrow errors if needed
Future<void> $initializeApp() async {
  _$initializeApp ??= Future<void>(() async {
    try {
      await configureDependencies();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      await _catchExceptions();
    } on Object catch (error, stackTrace) {
      await getIt.get<ErrorHandler>().send(error, stackTrace);
      rethrow;
    }
  });
  await _$initializeApp!;
}

/// Defines all platform errors
Future<void> _catchExceptions() async {
  FlutterError.onError = (details) {
    getIt.get<ErrorHandler>().send(details.exception, details.stack);
  };
}
