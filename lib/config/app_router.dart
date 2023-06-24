import 'package:auto_route/auto_route.dart';

import '../features/home/presentation/views/home_view.dart';
import '../features/login/presentation/views/login_view.dart';
import '../features/register/presentation/views/register_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
  ];
}
