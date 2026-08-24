import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/available_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableTimeList extends StatelessWidget {
  const AvailableTimeList({super.key, required this.availableTimeList});

  final List<AvailableTimeModel> availableTimeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => const HorizontalSpace(width: 9),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: availableTimeList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: AvailableTimeListItem(
            availableTime: availableTimeList[index],
            index: index,
          ),
        ),
      ),
    );
  }
}

class AvailableTimeListItem extends StatelessWidget {
  const AvailableTimeListItem({
    super.key,
    required this.availableTime,
    required this.index,
  });
  final AvailableTimeModel availableTime;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      decoration: BoxDecoration(
        color: index == 2
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            availableTime.time.toString(),
            style: context.textTheme.bodyMedium!.copyWith(
              color: index == 2 ? Colors.white : AppColors.primaryColor,
            ),
          ),
          const VerticalSpace(height: 2),

          Text(
            availableTime.title,
            style: context.textTheme.bodySmall!.copyWith(
              color: index == 2 ? Colors.white : AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
