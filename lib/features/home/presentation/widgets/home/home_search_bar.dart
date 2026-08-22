import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, required this.searchBarHeight});

  final double searchBarHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: searchBarHeight,
      child: AppTextFormField(
        // style: context.textTheme.titleSmall,
        hint: "Search...",
        onChanged: (word) {},
        borderRadius: 6.r,
        prefixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            Assets.assetsSvgsSearch,
            width: 11.45,
            height: 11.45,
            colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
        ),

        suffixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            Assets.assetsSvgsClose,
            width: 11.45,
            height: 11.45,
            colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
