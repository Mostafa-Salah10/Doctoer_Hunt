import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopAppBar extends StatelessWidget {
  const HomeTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Hi Handwerker! ",
                    style: context.textTheme.labelSmall,
                  ),
                ),
                const VerticalSpace(height: 8),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Find Your Doctor",
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: AppColors.lightBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBackgroundColor,
                image: DecorationImage(
                  image: const AssetImage(Assets.assetsImagesHomAppBarImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
