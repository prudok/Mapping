import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/features/login/data/datasource/firebase_login.dart';
import 'package:mapping/generated/l10n.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({required this.error, super.key});

  final LoginFailure error;

  @override
  Widget build(BuildContext context) {
    final isUndefinedError = error.index == 0;
    return AlertDialog(
      title: Text(
        isUndefinedError
            ? S.of(context).undefinedErrorWasOccurred
            : S.of(context).incorrectPasswordOrLogin,
      ),
      content: Text(
        S.of(context).pleaseTryAgain,
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (context.router.canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: Text(S.of(context).ok),
        ),
      ],
    );
  }
}
