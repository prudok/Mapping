import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_router.dart';
import '../../../../generated/l10n.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).notRegisteredYet),
        TextButton(
          onPressed: () {
            context.navigateTo(const RegisterRoute());
          },
          child: Text(S.of(context).register),
        )
      ],
    );
  }
}
