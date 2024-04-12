import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/auth/register_page.dart';
import 'package:social_media_app/ui/pages/auth/widgets/footer.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';
import 'package:social_media_app/ui/theme/theme.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';
import 'package:social_media_app/ui/pages/auth/widgets/my_text_form_field.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              controller: _emailController,
              hintText: 'Email',
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            MyTextFormField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            MyButton(
              text: 'Log in',
              borderColor: primaryColor,
              buttonColor: primaryColor,
              height: 50,
              radius: 25,
              fontWeight: medium,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, MainPage.routeName, (route) => false),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Footer(
              text: 'Don\'t have an account?',
              textButton: 'Register',
              onTap: () => Navigator.pushNamed(context, RegisterPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
