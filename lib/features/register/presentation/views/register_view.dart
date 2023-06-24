import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../login/presentation/widgets/login_button.dart';
import '../../../login/presentation/widgets/login_text_field.dart';
import '../cubit/register_cubit.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

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
                    key: _registerKey,
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
                    signInKey: _registerKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    // TODO: create generic inside LoginButton
                    onPressed: (_) {},
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
                    height: MediaQuery.sizeOf(context).height * 0.05,
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
