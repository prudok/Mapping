import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';

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
      child: TextFormField(
        obscureText: isObscureText ?? false,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
