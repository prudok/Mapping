import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          backgroundColor: const Color(0x00ffffff),
          unselectedItemColor: AppColors.lightGrey,
          selectedItemColor: AppColors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.area_chart_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded), label: 'Home'),
          ],
        ),
      ),
    );
  }
}
