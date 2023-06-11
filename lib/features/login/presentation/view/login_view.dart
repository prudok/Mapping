import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/device_sizes/device.dart';
import '../../../../core/constants/styles/buttons/common_button_style.dart';
import '../../domain/entities/user/user.dart';
import '../cubit/login_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _signInKey = GlobalKey<FormState>();

  String? _emailValidator(String? value) {
    if (value != null && value.isNotEmpty && value.contains('@')) {
      return null;
    } else {
      return 'Enter correct email.';
    }
  }

  String? _passwordValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Enter correct password.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginCubt = BlocProvider.of<LoginCubit>(context);
    Device().init(context);

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: Device.height! * 0.4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const Icon(Icons.map, size: 80, color: AppColors.purple),
                Form(
                  key: _signInKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => _emailValidator(value),
                        controller: _emailController,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(height: Device.height! * 0.02),
                      TextFormField(
                        obscureText: true,
                        validator: (value) => _passwordValidator(value),
                        controller: _passwordController,
                        decoration: const InputDecoration(hintText: 'Password'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Device.height! * 0.05),
                ElevatedButton(
                  style: commonButtonStyle,
                  onPressed: () {
                    if (_signInKey.currentState!.validate()) {
                      loginCubt.signInUser(
                        User(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
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
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return loginCubt.state.maybeWhen(
                      loading: (user) => const CircularProgressIndicator(),
                      loaded: () => const Icon(Icons.login),
                      orElse: () => const Text('Error'),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
