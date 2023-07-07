import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/app_router.dart';
import '../../../core/app_colors.dart';

@RoutePage()
class ViewNavigator extends StatelessWidget {
  const ViewNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const LoginRoute(),
        HomeRoute(userEmail: ''),
        const ProfileRoute(),
        const SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_rounded),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.area_chart_rounded),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail_rounded),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_rounded),
                  label: '',
                ),
              ],
              backgroundColor: const Color(0x00ffffff),
              unselectedItemColor: AppColors.lightGrey,
              selectedItemColor: AppColors.black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        );
      },
    );
  }
}
