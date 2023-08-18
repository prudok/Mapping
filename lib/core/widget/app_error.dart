import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('Something went wrong.', textScaleFactor: 2),
                Text('Please, rerun the application.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
