import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mapping/app.dart';
import 'package:mapping/config/injection.dart';
import 'package:mapping/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();

  runApp(const Mapping());
}
