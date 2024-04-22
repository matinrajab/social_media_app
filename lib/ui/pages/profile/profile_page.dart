import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/ui/pages/profile/edit_profile_page.dart';
import 'package:social_media_app/ui/pages/profile/widgets/about_me_section.dart';
import 'package:social_media_app/ui/pages/setting/setting_page.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';
import 'package:social_media_app/ui/widgets/post_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final bool _isPostEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) => MyAppBar(
            text: (state as AuthSuccess).user.username,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, SettingPage.routeName),
                  child: Image.asset(
                    '$iconsDir/menu.png',
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultPadding, defaultPadding, defaultPadding, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AboutMeSection(),
                    const SizedBox(
                      height: 16,
                    ),
                    MyButton(
                      text: 'Edit profile',
                      onTap: () => Navigator.pushNamed(
                          context, EditProfilePage.routeName),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'My Posts',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              _isPostEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Text(
                        'You haven\'t posted anything yet',
                        style: secondaryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const Column(
                      children: [
                        PostCard(
                          username: 'zuck',
                          dateTime: '2w',
                          content:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                          totalLikes: 5,
                          totalComments: 0,
                        ),
                        PostCard(
                          username: 'zuck',
                          dateTime: '2w',
                          content:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                          totalLikes: 5,
                          totalComments: 0,
                        ),
                        PostCard(
                          username: 'zuck',
                          dateTime: '2w',
                          content:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                          totalLikes: 5,
                          totalComments: 0,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
