import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mapping/features/home/presentation/cubit/home_cubit.dart';
import 'package:mapping/utils/firebase_instance.dart';

import 'config/app_router.dart';
import 'config/injection.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'generated/l10n.dart';

class Mapping extends StatefulWidget {
  const Mapping({super.key});

  @override
  State<Mapping> createState() => _MappingState();
}

class _MappingState extends State<Mapping> {
  late StreamSubscription<User?> _userSub;
  late bool isLoggedIn = false;

  @override
  void didChangeDependencies() {
    _userSub = fbAuth.authStateChanges().listen((User? user) {
      isLoggedIn = user != null ? true : false;
    });
    super.didChangeDependencies();
  }

  @override
  Future<void> dispose() async {
    await _userSub.cancel();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LoginCubit>()),
        BlocProvider(create: (_) => getIt<RegisterCubit>()),
        BlocProvider(create: (_) => getIt<HomeCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerDelegate: AutoRouterDelegate.declarative(
          getIt<AppRouter>(),
          // TODO: change routes below to router.config()
          routes: (_) => [
            if (isLoggedIn) const HomeRoute() else const LoginRoute(),
          ],
        ),
      ),
    );
  }
}
