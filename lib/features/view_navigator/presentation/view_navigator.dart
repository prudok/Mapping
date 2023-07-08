import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/app_router.dart';
import '../../../core/app_colors.dart';
import '../../../core/asset_paths.dart';
import '../../../utils/firebase_instance.dart';

@RoutePage()
class ViewNavigator extends StatelessWidget {
  const ViewNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: [
        const ProfileRoute(),
        HomeRoute(userEmail: fbAuth.currentUser!.email),
        const SettingsRoute(),
        const ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.menuIcon),
                  activeIcon: Image.asset(
                    AssetPaths.menuIcon,
                    color: AppColors.purple,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.achievementsIcon),
                  activeIcon: Image.asset(
                    AssetPaths.achievementsIcon,
                    color: AppColors.purple,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.chatIcon),
                  activeIcon: Image.asset(
                    AssetPaths.chatIcon,
                    color: AppColors.purple,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.profileIcon),
                  activeIcon: Image.asset(
                    AssetPaths.profileIcon,
                    color: AppColors.purple,
                  ),
                  label: '',
                ),
              ],
              backgroundColor: const Color(0x00ffffff),
              unselectedItemColor: AppColors.lightGrey,
              selectedItemColor: AppColors.purple,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        );
      },
    );
  }
}
