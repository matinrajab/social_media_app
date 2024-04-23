import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/cubits/user_cubit.dart';
import 'package:social_media_app/cubits/user_state.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_circular_indicator.dart';
import 'package:social_media_app/ui/widgets/my_message.dart';

class EditProfileFieldPage extends StatelessWidget {
  final String field;
  final String content;
  final int? maxLength;

  const EditProfileFieldPage({
    super.key,
    required this.field,
    required this.content,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController =
        TextEditingController(text: content);
    String id =
        context.select((AuthCubit auth) => (auth.state as AuthSuccess).user.id);

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: MyAppBar(
        text: 'Edit ${field.toLowerCase()}',
        leadingIcon: closeIcon,
        actions: [
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserSuccess) {
                context.read<AuthCubit>().getCurrentUser(id);
                Navigator.pop(context);
              } else if (state is UserFailed) {
                MyMessage.displayMessage(context, message: state.error);
              }
            },
            builder: (context, state) => (state is UserLoading)
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: MyCircularIndicator.show(
                      size: 15,
                      color: whiteColor,
                      strokeWidth: 2,
                    ),
                  )
                : IconButton(
                    onPressed: () => context.read<UserCubit>().updateUserField(
                          id: id,
                          field: field.toLowerCase(),
                          newValue: textController.text.trim(),
                        ),
                    icon: const Icon(
                      checkIcon,
                      color: whiteColor,
                    ),
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TextFormField(
          controller: textController,
          autofocus: true,
          style: primaryTextStyle,
          cursorColor: primaryTextColor,
          maxLength: maxLength,
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: field,
            labelStyle: secondaryTextStyle,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: secondaryTextColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
