import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/app_styles.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/generated/l10n.dart';

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
          height: MediaQuery.sizeOf(context).height * 0.8,
          width: double.infinity,
          child: const Column(
            children: [
              Expanded(flex: 3, child: ProfilePreview()),
              SizedBox(height: 10),
              AchievePreview(),
              SizedBox(height: 10),
              Expanded(flex: 4, child: Options()),
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Center(
                child: ListTile(
                  leading: Image.asset(
                    AssetPaths.settingsIcon,
                    color: AppColors.black,
                  ),
                  title: Text(S.of(context).settings),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            const Divider(height: 20, indent: 80, endIndent: 80),
            Expanded(
              child: Center(
                child: ListTile(
                  leading: Image.asset(
                    AssetPaths.settingsIcon,
                    color: AppColors.black,
                  ),
                  title: Text(S.of(context).settings),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            const Divider(height: 20, indent: 80, endIndent: 80),
            Expanded(
              child: Center(
                child: ListTile(
                  leading: Image.asset(
                    AssetPaths.settingsIcon,
                    color: AppColors.black,
                  ),
                  title: Text(S.of(context).settings),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
          child: Flex(
            direction: Axis.vertical,
            children: [
              const SizedBox(height: 15),
              Expanded(
                flex: 2,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 90,
                    minWidth: 90,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Flexible(child: Text('Andrew')),
              const Flexible(child: SizedBox(height: 10)),
              const Text('Beginner'),
            ],
          ),
        ),
      ],
    );
  }
}
