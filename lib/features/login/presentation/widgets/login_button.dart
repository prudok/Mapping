import 'package:flutter/material.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../domain/entities/user/user.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> signInKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onPressed,
  })  : _signInKey = signInKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _signInKey;
  final Function(User) onPressed;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

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
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            backgroundColor: AppColors.purple,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {
            if (_signInKey.currentState!.validate()) {
              onPressed(User(
                email: _emailController.text,
                password: _passwordController.text,
              ));
            }
          },
          child: const Text('Log In'),
        ),
      ),
    );
  }
}
