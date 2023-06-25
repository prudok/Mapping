import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: const HomeProfileAppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.2,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.03,
                right: MediaQuery.sizeOf(context).width * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Goal of the week'),
                            Text('50km'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.run_circle),
                  ),
                  const Column(
                    children: [
                      Text('Some text'),
                      Text('Some text'),
                    ],
                  ),
                  const Column(
                    children: [
                      Text('19'),
                      Text('km'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('History'),
                TextButton(
                  onPressed: () {},
                  child: const Text('All'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
