import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_router.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'service_locator.dart';
import 'utils/firebase_instance.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();
    bool _isloggedin = false;

    firebaseInstance.authStateChanges().listen((User? user) {
      if (user != null) {
        _isloggedin = true;
      } else {
        _isloggedin = false;
      }
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<RegisterCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate.declarative(
          _appRouter,
          routes: (_) => [
            if (_isloggedin) const HomeRoute() else const LoginRoute(),
          ],
        ),
        // debugShowCheckedModeBanner: false,
        // routerConfig: appRouter.config(),
      ),
    );
  }
}
