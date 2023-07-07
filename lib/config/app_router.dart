import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../features/home/presentation/views/home_view.dart';
import '../features/login/presentation/views/login_view.dart';
import '../features/profile/presentation/profile_view.dart';
import '../features/register/presentation/views/register_view.dart';
import '../features/settings/presentation/settings_view.dart';
import '../features/view_navigator/presentation/view_navigator.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: RouteNavigator.page,
          children: [
            AutoRoute(
              path: LoginRoute.name,
              page: LoginRoute.page,
            ),
            AutoRoute(
              path: HomeRoute.name,
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: ProfileRoute.name,
              page: ProfileRoute.page,
            ),
            AutoRoute(
              path: SettingsRoute.name,
              page: SettingsRoute.page,
            ),
          ],
        ),
      ];
}
