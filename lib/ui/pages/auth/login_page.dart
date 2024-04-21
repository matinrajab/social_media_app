import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/ui/pages/auth/register_page.dart';
import 'package:social_media_app/ui/pages/auth/widgets/footer.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';
import 'package:social_media_app/ui/pages/auth/widgets/my_text_form_field.dart';
import 'package:social_media_app/ui/widgets/my_circular_indicator.dart';
import 'package:social_media_app/ui/widgets/my_message.dart';

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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainPage.routeName, (route) => false);
                } else if (state is AuthFailed) {
                  MyMessage.displayMessage(context, message: state.error);
                }
              },
              builder: (context, state) => (state is AuthLoading)
                  ? MyCircularIndicator.show()
                  : MyButton(
                      text: 'Log in',
                      borderColor: primaryColor,
                      buttonColor: primaryColor,
                      height: 50,
                      radius: 25,
                      fontWeight: medium,
                      onTap: () => context.read<AuthCubit>().signIn(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                    ),
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
