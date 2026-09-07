import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  final String text;
  const CustomTextHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.darkBackgroundColor,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
