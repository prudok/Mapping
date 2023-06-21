import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../domain/entities/user/user.dart';
import '../cubit/login_cubit.dart';
import '../widgets/error_alert_dialog.dart';
import '../widgets/login_button.dart';
import '../widgets/login_text_field.dart';

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
          Container(
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
                  const Icon(Icons.map, size: 80, color: AppColors.purple),
                  Form(
                    key: _signInKey,
                    child: Column(
                      children: [
                        LoginTextField(
                          controller: _emailController,
                          isEmailTextFormField: true,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        LoginTextField(
                          controller: _passwordController,
                          isEmailTextFormField: false,
                          hintText: 'Password',
                          isObscureText: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  LoginButton(
                    signInKey: _signInKey,
                    loginCubit: loginCubit,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
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
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
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
                        loaded: () {
                          context.go('/');
                        },
                        orElse: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



