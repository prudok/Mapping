import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapping/features/home/presentation/views/home_view.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/device_sizes/device.dart';
import '../../../../core/constants/styles/buttons/common_button_style.dart';
import '../../../../utils/validators/login_validator.dart';
import '../../domain/entities/user/user.dart';
import '../cubit/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: Device.height! * 0.5),
                const Icon(Icons.map, size: 80, color: AppColors.purple),
                Form(
                  key: _signInKey,
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 400,
                        ),
                        child: TextFormField(
                          validator: (value) =>
                              LoginValidator.emailValidator(value),
                          controller: _emailController,
                          decoration: const InputDecoration(hintText: 'Email'),
                        ),
                      ),
                      SizedBox(height: Device.height! * 0.02),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 400,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) =>
                              LoginValidator.passwordValidator(value),
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Device.height! * 0.05),
                ElevatedButton(
                  style: commonButtonStyle,
                  onPressed: () {
                    loginCubit.signInUser(User(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ));
                  },
                  child: const Text('Log In'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Registered Yet?'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Register'),
                    )
                  ],
                ),
                loginCubit.state.maybeWhen(
                  loaded: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                    return const SizedBox();
                  },
                  orElse: () => const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
