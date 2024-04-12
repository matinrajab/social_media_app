import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/home/home_page.dart';
import 'package:social_media_app/ui/pages/main/widgets/my_bottom_nav_bar_item.dart';
import 'package:social_media_app/ui/pages/post/post_page.dart';
import 'package:social_media_app/ui/pages/profile/profile_page.dart';
import 'package:social_media_app/ui/theme/theme.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _enabledIconPaths = [
    'assets/icons/enabled_home.png',
    'assets/icons/enabled_write.png',
    'assets/icons/enabled_profile.png',
  ];

  final List<String> _focusedIconPaths = [
    'assets/icons/focused_home.png',
    '',
    'assets/icons/focused_profile.png',
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
      body: Column(
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
    );
  }
}
