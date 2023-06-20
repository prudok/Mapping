import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../utils/validators/login_validator.dart';
import '../../domain/entities/user/user.dart';
import '../cubit/login_cubit.dart';
import '../widget/error_alert_dialog.dart';

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
      backgroundColor: AppColors.lightGrey,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
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
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                          ),
                          child: TextFormField(
                            validator: (value) =>
                                LoginValidator.emailValidator(value),
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 400,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) =>
                                LoginValidator.passwordValidator(value),
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 100, maxWidth: 400),
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        backgroundColor: AppColors.purple,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        if (_signInKey.currentState!.validate()) {
                          loginCubit.signInUser(User(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ));
                        }
                      },
                      child: const Text('Log In'),
                    ),
                  ),
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
                BlocConsumer<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: (User user) {
                        return const CircularProgressIndicator();
                      },
                      orElse: () {
                        return const SizedBox();
                      },
                    );
                  },
                  listener: (context, state) {
                    state.maybeWhen(
                      loadFailed: (failure) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorAlertDialog(error: failure);
                          },
                        );
                      },
                      orElse: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
