import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/cubits/page_cubit.dart';
import 'package:social_media_app/cubits/post_controller_cubit.dart';
import 'package:social_media_app/cubits/post_controller_state.dart';
import 'package:social_media_app/cubits/post_cubit.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';

class PostPage extends StatelessWidget {
  static const routeName = '/post';

  PostPage({super.key});

  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String username = context
        .select((AuthCubit auth) => (auth.state as AuthSuccess).user.username);
    context
        .read<PostControllerCubit>()
        .isPostControllerEmpty(_postController.text);

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'New Post',
        leadingIcon: closeIcon,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                '$imagesDir/avatar.png',
                width: 36,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              username = (state as AuthSuccess).user.username;
                              return Text(
                                username,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                        ),
                        BlocBuilder<PostControllerCubit, PostControllerState>(
                          builder: (context, state) =>
                              (state is PostControllerNotEmpty)
                                  ? GestureDetector(
                                      onTap: () {
                                        _postController.clear();
                                        context
                                            .read<PostControllerCubit>()
                                            .isPostControllerEmpty(
                                                _postController.text);
                                      },
                                      child: const Icon(
                                        closeIcon,
                                        color: secondaryTextColor,
                                      ),
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _postController,
                      onChanged: (value) {
                        context
                            .read<PostControllerCubit>()
                            .isPostControllerEmpty(value.trim());
                      },
                      style: primaryTextStyle,
                      cursorColor: primaryTextColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What\'s new?',
                        hintStyle: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                      minLines: 1,
                      maxLines: 100,
                      autofocus: true,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    BlocBuilder<PostControllerCubit, PostControllerState>(
                      builder: (context, state) => MyButton(
                        text: 'Post',
                        width: 65,
                        fontColor: backgroundColor1,
                        buttonColor: (state is PostControllerEmpty)
                            ? inactiveWhiteButtonColor
                            : whiteColor,
                        borderColor: (state is PostControllerEmpty)
                            ? inactiveWhiteButtonColor
                            : whiteColor,
                        radius: 20,
                        onTap: (state is PostControllerNotEmpty)
                            ? () {
                                context.read<PostCubit>().createPost(
                                      username: username,
                                      content: _postController.text.trim(),
                                    );
                                context.read<PostCubit>().getPosts();
                                context.read<PageCubit>().setCurrentIndex(0);
                                Navigator.pushNamedAndRemoveUntil(context,
                                    MainPage.routeName, (route) => false);
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
