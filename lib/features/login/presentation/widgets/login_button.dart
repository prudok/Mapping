import 'package:flutter/material.dart';
import 'package:mapping/core/constants/app_styles.dart';

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
          style: AppStyles.widePurpleButtonStyle,
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
