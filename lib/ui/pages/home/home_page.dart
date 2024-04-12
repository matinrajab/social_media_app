import 'package:flutter/material.dart';
import 'package:social_media_app/ui/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page', style: primaryTextStyle,),
    );
  }
}
