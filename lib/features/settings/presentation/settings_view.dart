import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';
import 'package:mapping/core/asset_paths.dart';
import 'package:mapping/features/settings/presentation/about_view.dart';
import 'package:mapping/features/settings/presentation/feedback.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: const [
          OptionTile(
            iconPath: AssetPaths.settingsIcon,
            trailingIcon: Icon(Icons.arrow_forward_ios),
            widgetOnTap: AboutView(),
            title: Text('About'),
          ),
          SizedBox(height: 15),
          OptionTile(
            iconPath: AssetPaths.settingsIcon,
            trailingIcon: Icon(Icons.arrow_forward_ios),
            widgetOnTap: FeedbackView(),
            title: Text('Feedback'),
          ),
          SizedBox(height: 15),
          OptionTile(
            iconPath: AssetPaths.settingsIcon,
            trailingIcon: Icon(Icons.arrow_forward_ios),
            widgetOnTap: AboutView(),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  const OptionTile({
    required this.widgetOnTap,
    super.key,
    this.iconPath,
    this.title,
    this.trailingIcon,
  });

  final String? iconPath;
  final Widget? title;
  final Widget? trailingIcon;
  final Widget widgetOnTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ColoredBox(
        color: Theme.of(context).cardColor,
        child: ListTile(
          onTap: () {
            context.router.pushWidget(widgetOnTap);
          },
          leading: iconPath == null
              ? null
              : Image.asset(
                  iconPath!,
                  color: AppColors.black,
                ),
          title: title,
          trailing: trailingIcon,
        ),
      ),
    );
  }
}
