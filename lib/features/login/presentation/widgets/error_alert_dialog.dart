import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/generated/l10n.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(errorMessage),
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
