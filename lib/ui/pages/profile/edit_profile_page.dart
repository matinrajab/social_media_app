import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/ui/pages/profile/edit_profile_field_page.dart';
import 'package:social_media_app/ui/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit-profile';

  const EditProfilePage({super.key});

  final bool _isBioEmpty = true;

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSection(
                  context,
                  title: 'Name',
                  content: 'Matin Muhammad R',
                  maxLength: 150,
                ),
                buildDivider(),
                buildSection(
                  context,
                  title: 'Username',
                  content: 'matinmr__',
                  maxLength: 30,
                ),
                buildDivider(),
                buildSection(
                  context,
                  title: 'Bio',
                  content:
                      _isBioEmpty ? '+ Write bio' : 'Sfasfsg sadfdfsa fasdf',
                  contentTextColor:
                      _isBioEmpty ? secondaryTextColor : primaryTextColor,
                  isContentNull: _isBioEmpty,
                  maxLength: 150,
                ),
              ],
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
