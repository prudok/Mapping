import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../data/datasource/firebase_login.dart';

class ErrorAlertDialog extends StatelessWidget {
  final LoginFailure error;

  const ErrorAlertDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final isUndefinedError = error.index == 0;
    return AlertDialog(
      title: Text(
        isUndefinedError
            ? 'Undefined Error Was occurred'
            : 'Incorrect Password or Login.',
      ),
      content: const Text(
        'Please, try again.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (context.router.canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
