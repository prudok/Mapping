import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../utils/validators/login_validator.dart';
import '../../../login/data/datasource/firebase_login.dart';
import '../../../login/presentation/widgets/error_alert_dialog.dart';
import '../../../login/presentation/widgets/login_text_field.dart';
import '../cubit/register_cubit.dart';
import '../widgets/register_button.dart';
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
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

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
                          validator: LoginValidator.nameValidator,
                          isEmailTextFormField: false,
                          hintText: 'Name',
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        LoginTextField(
                          controller: _surnameController,
                          validator: LoginValidator.surnameValidator,
                          isEmailTextFormField: false,
                          hintText: 'Surname',
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
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
                  RegisterButton(
                    registerKey: _registerKey,
                    nameController: _nameController,
                    surnameController: _surnameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    onPressed: registerCubit.registerUser,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  const LoginOption(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
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
                          context.router.navigate(const HomeRoute());
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

