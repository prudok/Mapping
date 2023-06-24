import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../utils/validators/login_validator.dart';
import 'login_form_field.dart';

class LoginTextField extends StatelessWidget {
  final String? hintText;
  final bool? isObscureText;
  final TextEditingController controller;
  final bool isEmailTextFormField;

  const LoginTextField({
    super.key,
    this.hintText,
    this.isObscureText,
    required this.controller,
    required this.isEmailTextFormField,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100,
        maxWidth: 400,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: LoginFormField(
          controller: controller,
          validator: (value) => isEmailTextFormField
              ? LoginValidator.emailValidator(value)
              : LoginValidator.passwordValidator(value),
          hintText: hintText ?? '',
          isObscureText: isObscureText,
        ),
      ),
    );
  }
}
