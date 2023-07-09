import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/app_styles.dart';
import 'package:mapping/core/asset_paths.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Image.asset(AssetPaths.settingsIcon),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: AppColors.orange,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: const Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 2,
                child: ProfilePreview(),
              ),
              SizedBox(height: 15),
              Flexible(
                child: AchievePreview(),
              ),
              SizedBox(height: 20),
              Flexible(
                flex: 3,
                child: Options(),
              ),
              Flexible(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: Image.asset(
                AssetPaths.settingsIcon,
                color: AppColors.black,
              ),
              title: const Text('Settings'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const Divider(height: 20, indent: 80, endIndent: 80),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const Divider(height: 20, indent: 80, endIndent: 80),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const Divider(height: 20, indent: 80, endIndent: 80),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievePreview extends StatelessWidget {
  const AchievePreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text('103,2'),
                          Text('km'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text('103,2'),
                          Text('km'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text('103,2'),
                          Text('km'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePreview extends StatelessWidget {
  const ProfilePreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: AppStyles.roundedOnlyBottomEdges.copyWith(
            color: AppColors.orange,
          ),
        ),
        Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Andrew'),
              const SizedBox(height: 10),
              const Text('Beginner'),
            ],
          ),
        ),
      ],
    );
  }
}
