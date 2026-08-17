import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class SignUpTextSection extends StatelessWidget {
  const SignUpTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 90),
        Text(
          "Join us to start searching",
          style: context.textTheme.displayLarge,
        ),
        const VerticalSpace(height: 15),

        Text(
          "You can search c ourse, apply course and find\nscholarship for abroad studies",
          style: context.textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(height: 67),
      ],
    );
  }
}
