import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/auth_social_secton.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/sign_up_text_section.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthTextSection(
              title: "Welcome back",
              subTitle:
                  "You can search c ourse, apply course and find\nscholarship for abroad studies",
            ),
            const AuthSocialSection(),
            const SignInForm(),
          ],
        ),
      ),
    );
  }
}
