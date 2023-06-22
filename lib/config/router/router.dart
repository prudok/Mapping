import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/login/presentation/views/login_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
      routes:[
        GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginView();
            }
        ),
        GoRoute(
            path: 'register',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginView();
            }
        ),
      ]
    ),
  ],
);
