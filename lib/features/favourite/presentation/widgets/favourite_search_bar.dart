import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteSearchBar extends StatelessWidget {
  const FavouriteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: AppTextFormField(
        hint: "Dentist",
        onChanged: (doctor) {},
        borderRadius: 6.r,
        prefixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            Assets.assetsSvgsSearch,
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
        ),

        suffixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            Assets.assetsSvgsClose,
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
