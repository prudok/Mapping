import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_router.dart';
import '../../../../generated/l10n.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).alreadyHaveAnAccount),
        TextButton(
          onPressed: () {
            context.navigateTo(const LoginRoute());
          },
          child: Text(S.of(context).signIn),
        )
      ],
    );
  }
}
