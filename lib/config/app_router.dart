import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/utils/firebase_instance.dart';

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
  final UserSignInChecker userSignInChecker;

  AppRouter(this.userSignInChecker);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/${LoginRoute.name}',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/${RegisterRoute.name}',
          page: RegisterRoute.page,
        ),
        AutoRoute(
          path: '/',
          guards: [userSignInChecker],
          page: RouteNavigator.page,
          children: [
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

// Guard Routes
@injectable
class UserSignInChecker extends AutoRouteGuard {
  @override
  void onNavigation(resolver, router) async {
    if (fbAuth.currentUser != null) {
      resolver.next(true);
    } else {
      router.pushNamed('/${LoginRoute.name}');
    }
  }
}
