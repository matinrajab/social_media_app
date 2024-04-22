import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/page_cubit.dart';
import 'package:social_media_app/ui/pages/home/home_page.dart';
import 'package:social_media_app/ui/pages/main/widgets/my_bottom_nav_bar_item.dart';
import 'package:social_media_app/ui/pages/post/post_page.dart';
import 'package:social_media_app/ui/pages/profile/profile_page.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';

  MainPage({super.key});

  final List<String> _enabledIconPaths = [
    '$iconsDir/enabled_home.png',
    '$iconsDir/enabled_write.png',
    '$iconsDir/enabled_profile.png',
  ];

  final List<String> _focusedIconPaths = [
    '$iconsDir/focused_home.png',
    '',
    '$iconsDir/focused_profile.png',
  ];

  final List<Widget> _body = [
    const HomePage(),
    const SizedBox(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: BlocBuilder<PageCubit, int>(
          builder: (context, currentIndex) => Column(
            children: [
              Expanded(
                child: _body[currentIndex],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyBottomNavBarItem(
                    onTap: () => context.read<PageCubit>().setCurrentIndex(0),
                    imageAsset: currentIndex == 0
                        ? _focusedIconPaths[0]
                        : _enabledIconPaths[0],
                  ),
                  MyBottomNavBarItem(
                    onTap: () =>
                        Navigator.pushNamed(context, PostPage.routeName),
                    imageAsset: _enabledIconPaths[1],
                  ),
                  MyBottomNavBarItem(
                    onTap: () => context.read<PageCubit>().setCurrentIndex(2),
                    imageAsset: currentIndex == 2
                        ? _focusedIconPaths[2]
                        : _enabledIconPaths[2],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
