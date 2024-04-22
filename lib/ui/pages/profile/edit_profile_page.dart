import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/ui/pages/profile/edit_profile_field_page.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit-profile';

  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'Edit Profile',
        leadingIcon: closeIcon,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                color: dividerColor,
              ),
            ),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                UserModel user = (state as AuthSuccess).user;
                bool isBioEmpty = user.bio == '';
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSection(
                      context,
                      title: 'Name',
                      content: user.name,
                      maxLength: 150,
                    ),
                    buildDivider(),
                    buildSection(
                      context,
                      title: 'Username',
                      content: user.username,
                      maxLength: 30,
                    ),
                    buildDivider(),
                    buildSection(
                      context,
                      title: 'Bio',
                      content: isBioEmpty ? '+ Write bio' : user.bio,
                      contentTextColor:
                          isBioEmpty ? secondaryTextColor : primaryTextColor,
                      isContentNull: isBioEmpty,
                      maxLength: 150,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSection(
    context, {
    required String title,
    required String content,
    Color contentTextColor = primaryTextColor,
    bool isContentNull = false,
    int? maxLength,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfileFieldPage(
            title: title,
            content: isContentNull ? '' : content,
            maxLength: maxLength,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          Text(
            content,
            style: GoogleFonts.poppins(
              color: contentTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return const Column(
      children: [
        SizedBox(
          height: 4,
        ),
        Divider(
          color: dividerColor,
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
