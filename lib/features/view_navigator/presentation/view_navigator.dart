import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/config/app_router.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/utils/firebase_instance.dart';

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
        const ChatRoute(),
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
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.menuIcon),
                  activeIcon: Image.asset(
                    AssetPaths.menuIcon,
                    color: AppColors.orange,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.achievementsIcon),
                  activeIcon: Image.asset(
                    AssetPaths.achievementsIcon,
                    color: AppColors.orange,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AssetPaths.chatIcon),
                  activeIcon: Image.asset(
                    AssetPaths.chatIcon,
                    color: AppColors.orange,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AssetPaths.settingsIcon,
                    color: AppColors.grey,
                  ),
                  activeIcon: Image.asset(
                    AssetPaths.settingsIcon,
                    color: AppColors.orange,
                  ),
                  label: '',
                ),
              ],
              backgroundColor: const Color(0x00ffffff),
              unselectedItemColor: AppColors.lightGrey,
              selectedItemColor: AppColors.orange,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        );
      },
    );
  }
}
