import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    required this.controller,
    required this.validator,
    required this.hintText,
    super.key,
    this.isObscureText,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final bool? isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
