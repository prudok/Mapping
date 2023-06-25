import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../utils/cubits/user_auth_cubit.dart';
import '../../../../utils/validators/login_validator.dart';
import '../../domain/entities/user/user.dart';
import '../cubit/login_cubit.dart';
import '../widgets/error_alert_dialog.dart';
import '../widgets/login_button.dart';
import '../widgets/login_text_field.dart';

@RoutePage()
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
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    final userAuthCubit = BlocProvider.of<UserAuthCubit>(context);

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
                          validator: LoginValidator.emailValidator,
                          isEmailTextFormField: true,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        LoginTextField(
                          controller: _passwordController,
                          validator: LoginValidator.passwordValidator,
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
                    emailController: _emailController,
                    passwordController: _passwordController,
                    onPressed: loginCubit.signInUser,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not Registered Yet?'),
                      TextButton(
                        onPressed: () {
                          context.navigateTo(const RegisterRoute());
                        },
                        child: const Text('Register'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: BlocConsumer<LoginCubit, LoginState>(
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
                            context.router.navigate(const HomeRoute());
                          },
                          orElse: () {},
                        );
                      },
                    ),
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
