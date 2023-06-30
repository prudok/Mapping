import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_router.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'generated/l10n.dart';
import 'service_locator.dart';
import 'utils/firebase_instance.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    bool isloggedin = false;

    firebaseAuthInstance.authStateChanges().listen((User? user) {
      if (user != null) {
        isloggedin = true;
      } else {
        isloggedin = false;
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
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        // TODO: uncomment when finish feature of registration
        // routerDelegate: AutoRouterDelegate.declarative(
        //   appRouter,
        //   routes: (_) => [
        //     const RegisterRoute()
        //     // if (isloggedin) const HomeRoute() else const LoginRoute(),
        //   ],
        // ),
        // debugShowCheckedModeBanner: false,
        // routerConfig: appRouter.config(),
      ),
    );
  }
}
