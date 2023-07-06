import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_router.dart';
import 'config/injection.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/register/presentation/bloc/register_bloc.dart';
import 'generated/l10n.dart';
import 'utils/firebase_instance.dart';

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
        BlocProvider(create: (_) => getIt<LoginBloc>()),
        BlocProvider(create: (_) => getIt<RegisterBloc>()),
        BlocProvider(create: (_) => getIt<HomeBloc>()),
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
        routerConfig: getIt<AppRouter>().config(),
      ),
    );
  }
}
