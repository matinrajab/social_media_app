import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/auth/widgets/footer.dart';
import 'package:social_media_app/ui/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';
import 'package:social_media_app/ui/pages/auth/widgets/my_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  RegisterPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
              controller: _nameController,
              labelText: 'Name',
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            MyTextFormField(
              controller: _usernameController,
              labelText: 'Username',
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            MyTextFormField(
              controller: _emailController,
              labelText: 'Email',
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            MyTextFormField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            const MyButton(
              text: 'Register',
              borderColor: primaryColor,
              buttonColor: primaryColor,
              height: 50,
              radius: 25,
              fontWeight: medium,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Footer(
              text: 'Already have an account?',
              textButton: 'Login',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
