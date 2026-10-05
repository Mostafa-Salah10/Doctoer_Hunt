import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/upper_lower_extension.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCategoryList extends StatelessWidget {
  const AppointmentCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      buildWhen: (previous, current) =>
          previous.bookingStatus != current.bookingStatus,
      builder: (context, state) {
        return Row(
          children: [
            ...List.generate(BookingStatus.values.length, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      context.read<AppointmentCubit>().updateBookingStatus(
                        BookingStatus.values.elementAt(index),
                      );
                    },
                    child: AppointmentCategoryListItem(
                      isSelected:
                          state.bookingStatus ==
                          BookingStatus.values.elementAt(index),
                      title: BookingStatus.values
                          .elementAt(index)
                          .name
                          .toUpperCaseFirst,
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

class AppointmentCategoryListItem extends StatelessWidget {
  const AppointmentCategoryListItem({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        spacing: 4.h,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium!.copyWith(
              color: isSelected
                  ? AppColors.lightBackgroundColor
                  : AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
