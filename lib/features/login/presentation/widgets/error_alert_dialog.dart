import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
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
