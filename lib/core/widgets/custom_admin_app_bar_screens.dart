import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomAdminAppBarScreens extends StatelessWidget {
  const CustomAdminAppBarScreens({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.darkTextColor,

            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        SvgPicture.asset(Assets.assetsSvgsAdminActions, width: 80),
      ],
    );
  }
}
