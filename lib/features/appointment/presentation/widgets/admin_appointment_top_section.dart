import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/booking_status.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/appointment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAppointmentTopSection extends StatelessWidget {
  const AdminAppointmentTopSection({super.key, required this.appointmentModel});

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: CustomCachedNetworkImage(
            imageUrl: appointmentModel.paientImage,
          ),

          // child: Image.asset(Assets.assetsImagesAppointment),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                appointmentModel.patientName,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.isDarkMode
                      ? AppColors.lightBackgroundColor
                      : AppColors.darkTextColor,
                ),
              ),

              const VerticalSpace(height: 5),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                appointmentModel.doctorName,
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.doctorGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VerticalSpace(height: 5),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                appointmentModel.speciality,
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.greyTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: appointmentModel.status == BookingStatus.cancelled
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
                  color: appointmentModel.status == BookingStatus.cancelled
                      ? AppColors.errorColor
                      : AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                appointmentModel.status.name,
                style: context.textTheme.bodySmall!.copyWith(
                  color: appointmentModel.status == BookingStatus.cancelled
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
