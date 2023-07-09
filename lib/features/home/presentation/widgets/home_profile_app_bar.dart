import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';

class HomeProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.purple,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.access_time),
        onPressed: () {},
      ),
      title: const Column(
        children: [
          Text('Template'),
          Text('Template'),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
