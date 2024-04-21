import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';
import 'package:social_media_app/ui/widgets/my_alert_dialog.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_circular_indicator.dart';
import 'package:social_media_app/ui/widgets/my_message.dart';

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
              builder: (BuildContext context) =>
                  BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthInitial) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginPage.routeName, (route) => false);
                  } else if (state is AuthFailed) {
                    MyMessage.displayMessage(context, message: state.error);
                  }
                },
                builder: (context, state) => (state is AuthLoading)
                    ? MyCircularIndicator.show()
                    : MyAlertDialog(
                        alertText: 'Log out of\nyour account?',
                        acceptText: 'Log out',
                        onAcceptTapped: () =>
                            context.read<AuthCubit>().signOut(),
                      ),
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
