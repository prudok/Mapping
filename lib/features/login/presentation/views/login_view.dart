import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_router.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/login_validator.dart';
import '../cubit/login_cubit.dart';
import '../widgets/error_alert_dialog.dart';
import '../widgets/login_button.dart';
import '../widgets/login_text_field.dart';
import '../widgets/register_option.dart';

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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: AppStyles.roundedOnlyBottomEdges.copyWith(
              color: AppColors.lightGrey,
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
                          validator: (value) =>
                              FormValidator.emailValidator(context, value),
                          isEmailTextFormField: true,
                          hintText: S.of(context).email,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        LoginTextField(
                          controller: _passwordController,
                          validator: (value) =>
                              FormValidator.passwordValidator(context, value),
                          isEmailTextFormField: false,
                          hintText: S.of(context).password,
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
                  const RegisterOption(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: BlocConsumer<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () {
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
                          logIn: (_) {
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
