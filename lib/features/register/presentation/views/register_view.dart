import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapping/config/app_router.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/app_styles.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/features/login/presentation/widgets/error_alert_dialog.dart';
import 'package:mapping/features/login/presentation/widgets/login_text_field.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/features/register/presentation/bloc/register_bloc.dart';
import 'package:mapping/features/register/presentation/widgets/login_option.dart';
import 'package:mapping/generated/l10n.dart';
import 'package:mapping/utils/login_validator.dart';

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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AssetPaths.welcomeImage),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).fillTheForm,
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _registerKey,
                      child: Column(
                        children: [
                          LoginTextField(
                            controller: _nameController,
                            validator: (value) => FormValidator.nameValidator(
                              context,
                              value,
                            ),
                            isEmailTextFormField: false,
                            hintText: S.of(context).name,
                          ),
                          const SizedBox(height: 20),
                          LoginTextField(
                            controller: _surnameController,
                            validator: (value) =>
                                FormValidator.surnameValidator(
                              context,
                              value,
                            ),
                            isEmailTextFormField: false,
                            hintText: S.of(context).surname,
                          ),
                          const SizedBox(height: 20),
                          LoginTextField(
                            controller: _emailController,
                            validator: (value) => FormValidator.emailValidator(
                              context,
                              value,
                            ),
                            isEmailTextFormField: true,
                            hintText: S.of(context).email,
                          ),
                          const SizedBox(height: 20),
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
                            }
                          },
                          style: AppStyles.wideButtonStyle,
                          child: Text(
                            S.of(context).register,
                            style: const TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    const LoginOption(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      child: BlocConsumer<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            registering: () => Center(
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
                            ),
                            orElse: () => const SizedBox(),
                          );
                        },
                        listener: (context, state) {
                          state.maybeWhen(
                            registerFailed: (failureMsg) => showDialog<void>(
                              builder: (_) => ErrorAlertDialog(
                                errorMessage: failureMsg,
                              ),
                              context: context,
                            ),
                            registered: (userRegInfo) {
                              context.router.navigate(
                                HomeRoute(
                                  userEmail: userRegInfo.email,
                                ),
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
