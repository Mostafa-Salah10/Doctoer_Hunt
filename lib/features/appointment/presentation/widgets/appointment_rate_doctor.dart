import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentRateDoctorWidget extends StatelessWidget {
  const AppointmentRateDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 10),

        Container(
          padding: EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),

            borderRadius: BorderRadius.circular(6),
          ),

          child: Row(
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "Tap to rate your visit",
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ),

              ...List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SvgPicture.asset(
                    Assets.assetsSvgsStarOutline,
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      Colors.amber,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
