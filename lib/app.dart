import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mapping/config/app_router.dart';
import 'package:mapping/config/injection.dart';
import 'package:mapping/config/themes.dart';
import 'package:mapping/features/home/presentation/bloc/home_bloc.dart';
import 'package:mapping/features/login/presentation/bloc/login_bloc.dart';
import 'package:mapping/features/register/presentation/bloc/register_bloc.dart';
import 'package:mapping/generated/l10n.dart';

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
        theme: lightTheme,
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
