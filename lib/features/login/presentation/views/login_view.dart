import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapping/config/app_router.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/app_styles.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/features/login/domain/entities/user/login_user.dart';
import 'package:mapping/features/login/presentation/bloc/login_bloc.dart';
import 'package:mapping/features/login/presentation/widgets/error_alert_dialog.dart';
import 'package:mapping/features/login/presentation/widgets/login_text_field.dart';
import 'package:mapping/features/login/presentation/widgets/register_option.dart';
import 'package:mapping/generated/l10n.dart';
import 'package:mapping/utils/login_validator.dart';

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
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: AppStyles.roundedOnlyBottomEdges.copyWith(
                color: AppColors.lightGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(AssetPaths.welcomeImage),
                    const SizedBox(height: 20),
                    const Text(
                      'Enter Your Email And Password',
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _signInKey,
                      child: Column(
                        children: [
                          LoginTextField(
                            controller: _emailController,
                            validator: (value) => FormValidator.emailValidator(
                              context,
                              value,
                            ),
                            isEmailTextFormField: true,
                            hintText: S.of(context).email,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.02,
                          ),
                          LoginTextField(
                            controller: _passwordController,
                            validator: (value) =>
                                FormValidator.passwordValidator(
                              context,
                              value,
                            ),
                            isEmailTextFormField: false,
                            hintText: S.of(context).password,
                            isObscureText: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        minWidth: 100,
                        maxWidth: 400,
                      ),
                      child: SizedBox.expand(
                        child: ElevatedButton(
                          style: AppStyles.wideButtonStyle,
                          onPressed: () {
                            if (_signInKey.currentState!.validate()) {
                              loginBloc.add(
                                LoginEvent.signIn(
                                  LoginUser(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            S.of(context).logIn,
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    const RegisterOption(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      child: BlocConsumer<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () {
                              return Center(
                                child: SizedBox(
                                  width: 100,
                                  height: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const LinearProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        AppColors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                              );
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
                                  return ErrorAlertDialog(
                                      errorMessage: failure);
                                },
                              );
                            },
                            logIn: (loginUserData) {
                              context.router.navigate(
                                HomeRoute(userEmail: loginUserData.email),
                              );
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
      ),
    );
  }
}
