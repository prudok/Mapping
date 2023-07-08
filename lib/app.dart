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

class Mapping extends StatelessWidget {
  const Mapping({super.key});

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
        routerDelegate: getIt<AppRouter>().delegate(),
        routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      ),
    );
  }
}
