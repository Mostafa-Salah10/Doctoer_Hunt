import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class AuthTextSection extends StatelessWidget {
  const AuthTextSection({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 90),
        Text(title, style: context.textTheme.displayLarge),
        const VerticalSpace(height: 15),

        Text(
          subTitle,
          style: context.textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(height: 67),
      ],
    );
  }
}
