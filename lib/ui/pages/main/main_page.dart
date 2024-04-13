import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/home/home_page.dart';
import 'package:social_media_app/ui/pages/main/widgets/my_bottom_nav_bar_item.dart';
import 'package:social_media_app/ui/pages/post/post_page.dart';
import 'package:social_media_app/ui/pages/profile/profile_page.dart';
import 'package:social_media_app/ui/shared/assets_dir.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _body[_currentIndex],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyBottomNavBarItem(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  imageAsset: _currentIndex == 0
                      ? _focusedIconPaths[0]
                      : _enabledIconPaths[0],
                ),
                MyBottomNavBarItem(
                  onTap: () => Navigator.pushNamed(context, PostPage.routeName),
                  imageAsset: _enabledIconPaths[1],
                ),
                MyBottomNavBarItem(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  imageAsset: _currentIndex == 2
                      ? _focusedIconPaths[2]
                      : _enabledIconPaths[2],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
