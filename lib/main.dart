import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mapping/app.dart';
import 'package:mapping/config/config.dart';
import 'package:mapping/firebase_options.dart';

void main() => runZonedGuarded<void>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        await configureDependencies();
        runApp(const Mapping());
      },
      (Object error, StackTrace stackTrace) {
        getIt.get<ErrorHandler>().send(error, stackTrace);
      },
    );
