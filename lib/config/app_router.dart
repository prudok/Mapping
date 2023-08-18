import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/home/presentation/views/home_view.dart';
import 'package:mapping/features/login/presentation/views/login_view.dart';
import 'package:mapping/features/profile/presentation/profile_view.dart';
import 'package:mapping/features/register/presentation/views/register_view.dart';
import 'package:mapping/features/settings/presentation/settings_view.dart';
import 'package:mapping/features/view_navigator/presentation/view_navigator.dart';
import 'package:mapping/utils/firebase_instance.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  AppRouter(this.userSignInChecker);

  final UserSignInChecker userSignInChecker;

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
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (fbAuth.currentUser != null) {
      resolver.next();
    } else {
      await router.replaceNamed('/${LoginRoute.name}');
    }
  }
}
