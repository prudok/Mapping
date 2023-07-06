import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_router.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/login_validator.dart';
import '../../../login/data/datasource/firebase_login.dart';
import '../../../login/presentation/widgets/error_alert_dialog.dart';
import '../../../login/presentation/widgets/login_text_field.dart';
import '../../domain/entities/user_registration_info.dart';
import '../bloc/register_bloc.dart';
import '../widgets/login_option.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final _registerKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);

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
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
                  const Icon(Icons.map, size: 80, color: AppColors.purple),
                  Form(
                    key: _registerKey,
                    child: Column(
                      children: [
                        LoginTextField(
                          controller: _nameController,
                          validator: (value) =>
                              FormValidator.nameValidator(context, value),
                          isEmailTextFormField: false,
                          hintText: S.of(context).name,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        LoginTextField(
                          controller: _surnameController,
                          validator: (value) =>
                              FormValidator.surnameValidator(context, value),
                          isEmailTextFormField: false,
                          hintText: S.of(context).surname,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
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
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      minWidth: 100,
                      maxWidth: 400,
                    ),
                    child: SizedBox.expand(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_registerKey.currentState!.validate()) {
                            registerBloc.add(
                              RegisterEvent.registerUser(
                                userRegInfo: UserRegInfo(
                                  name: _nameController.text.trim(),
                                  surName: _surnameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              ),
                            );
                            context.navigateTo(HomeRoute(
                              userEmail: _emailController.text.trim(),
                            ));
                          }
                        },
                        style: AppStyles.widePurpleButtonStyle,
                        child: Text(S.of(context).register),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  const LoginOption(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        registering: () => const CircularProgressIndicator(),
                        orElse: () => const SizedBox(),
                      );
                    },
                    listener: (context, state) {
                      state.maybeWhen(
                        registerFailed: (failure) => const ErrorAlertDialog(
                          error: LoginFailure.invalidCredentials,
                        ),
                        registered: () {
                          // TODO: set required email parameter into registered state
                          context.router.navigate(HomeRoute(
                            userEmail: _emailController.text.trim(),
                          ));
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
