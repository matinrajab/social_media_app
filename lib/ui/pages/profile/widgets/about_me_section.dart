import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  UserModel user = (state as AuthSuccess).user;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        user.username,
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Image.asset(
              '$imagesDir/avatar.png',
              height: 68,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            String bio = (state as AuthSuccess).user.bio;
            return bio == ''
                ? const SizedBox()
                : Text(
                    bio,
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: light,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
