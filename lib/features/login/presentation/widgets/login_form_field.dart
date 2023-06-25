import 'package:flutter/material.dart';
import 'package:mapping/core/constants/app_colors.dart';

class LoginFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) validator;
  final String hintText;
  final bool? isObscureText;

  const LoginFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      validator: (value) => validator(value),
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
