import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class MyBottomNavBarItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final String imageAsset;

  const MyBottomNavBarItem({
    super.key,
    required this.onTap,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: transparentColor,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: SizedBox(
          width: 56,
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Image.asset(
                imageAsset,
                height: 32,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
