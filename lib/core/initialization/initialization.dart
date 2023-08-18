import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapping/config/config.dart';
import 'package:mapping/firebase_options.dart';

Future<void>? _$initializeApp;

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
}

Future<void> _catchExceptions() async {
  FlutterError.onError = (details) {
    getIt.get<ErrorHandler>().send(details.exception, details.stack);
  };
}
