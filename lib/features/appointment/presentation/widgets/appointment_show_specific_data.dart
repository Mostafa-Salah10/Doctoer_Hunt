import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentShowSpecificDataCard extends StatelessWidget {
  const AppointmentShowSpecificDataCard({
    super.key,

    this.showContainer = false,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  final bool showContainer;

  @override
  Widget build(BuildContext context) {
    return showContainer
        ? Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffF7FAF8),
              borderRadius: BorderRadius.circular(10),
            ),

            child: _buildWidget(context),
          )
        : _buildWidget(context);
  }

  Row _buildWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),

            borderRadius: BorderRadius.circular(10),
          ),

          child: SvgPicture.asset(image, width: 20, height: 20),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 7,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  // maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                  title,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 11.sp,
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  // maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                  subTitle,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 14.sp,

                    color: context.isDarkMode
                        ? AppColors.lightBackgroundColor
                        : AppColors.darkBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
