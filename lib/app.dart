import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_router.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'generated/l10n.dart';
import 'config/injection.dart';
import 'utils/firebase_instance.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    bool isloggedin = false;

    fbAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        isloggedin = true;
      } else {
        isloggedin = false;
      }
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<RegisterCubit>(),
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
        routerDelegate: AutoRouterDelegate.declarative(
          appRouter,
          routes: (_) => [
            if (isloggedin) const HomeRoute() else const LoginRoute(),
          ],
        ),
      ),
    );
  }
}
