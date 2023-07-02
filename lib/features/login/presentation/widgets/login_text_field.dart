import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import 'login_form_field.dart';

class LoginTextField extends StatelessWidget {
  final String? hintText;
  final bool? isObscureText;
  final TextEditingController controller;
  final bool isEmailTextFormField;
  final Function(String?) validator;

  const LoginTextField({
    super.key,
    this.hintText,
    this.isObscureText,
    required this.controller,
    required this.isEmailTextFormField,
    required this.validator,
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
          validator: (value) => validator(value),
          hintText: hintText ?? '',
          isObscureText: isObscureText,
        ),
      ),
    );
  }
}
