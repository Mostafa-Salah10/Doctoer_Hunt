import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';

class HomeTitleAndSeeAll extends StatelessWidget {
  const HomeTitleAndSeeAll({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.darkBackgroundColor,
          ),
        ),
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: Text("See all >", style: context.textTheme.titleSmall),
          ),
      ],
    );
  }
}
