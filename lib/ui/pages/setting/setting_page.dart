import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';
import 'package:social_media_app/ui/widgets/my_alert_dialog.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting';

  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'Settings',
        leadingIcon: backIcon,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: GestureDetector(
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => MyAlertDialog(
                alertText: 'Log out of\nyour account?',
                acceptText: 'Log out',
                onAcceptTapped: () => Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.routeName, (route) => false),
              ),
            );
          },
          child: Text(
            'Log out',
            style: dangerTextStyle,
          ),
        ),
      ),
    );
  }
}
