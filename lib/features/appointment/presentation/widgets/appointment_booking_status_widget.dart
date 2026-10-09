import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';

class AppointmentBookingStatusWidget extends StatelessWidget {
  const AppointmentBookingStatusWidget({super.key, required this.status});

  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          "Appointment",
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: status == BookingStatus.cancelled
                ? AppColors.errorColor.withValues(alpha: 0.1)
                : AppColors.primaryColor.withValues(alpha: 0.1),
          ),

          child: Row(
            spacing: 7,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: status == BookingStatus.cancelled
                      ? AppColors.errorColor
                      : AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                status.name,
                style: context.textTheme.bodySmall!.copyWith(
                  color: status == BookingStatus.cancelled
                      ? AppColors.errorColor
                      : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
