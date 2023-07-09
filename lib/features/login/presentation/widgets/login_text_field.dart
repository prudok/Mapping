import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/features/login/presentation/widgets/login_form_field.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    required this.controller,
    required this.isEmailTextFormField,
    required this.validator,
    super.key,
    this.hintText,
    this.isObscureText,
  });

  final String? hintText;
  final bool? isObscureText;
  final TextEditingController controller;
  final bool isEmailTextFormField;
  final String? Function(String?) validator;

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
          validator: validator,
          hintText: hintText ?? '',
          isObscureText: isObscureText,
        ),
      ),
    );
  }
}
