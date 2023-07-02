import 'package:flutter/material.dart';

import '../../../../core/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/user_registration_info.dart';

class RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> registerKey;
  final Function(UserRegInfo) onPressed;
  final TextEditingController emailController;

  final TextEditingController passwordController;

  final TextEditingController nameController;

  final TextEditingController surnameController;

  const RegisterButton({
    super.key,
    required this.registerKey,
    required this.onPressed,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.surnameController,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 50,
        minWidth: 100,
        maxWidth: 400,
      ),
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {
            if (registerKey.currentState!.validate()) {
              onPressed(
                UserRegInfo(
                  name: nameController.text.trim(),
                  surName: surnameController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
            }
          },
          style: AppStyles.widePurpleButtonStyle,
          child: Text(S.of(context).register),
        ),
      ),
    );
  }
}
