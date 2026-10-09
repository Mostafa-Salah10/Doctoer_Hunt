import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/when_pop_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/auth_social_secton.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/sign_up_text_section.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.role});
  final Role role;

  @override
  Widget build(BuildContext context) {
    return WhenPopScreen(
      child: CustomBackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthTextSection(
                title: "Join us to start searching",
                subTitle:
                    "You can search c ourse, apply course and find\nscholarship for abroad studies",
              ),
              const AuthSocialSection(),
              SignUpForm(role: role),
            ],
          ),
        ),
      ),
    );
  }
}
