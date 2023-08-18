import 'package:flutter/material.dart';
import 'package:mapping/core/core.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetPaths.errorIcon, height: 100),
                const SizedBox(height: 15),
                const Text('Something went wrong.', textScaleFactor: 2),
                const SizedBox(height: 10),
                const Text('Please, rerun the application.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
