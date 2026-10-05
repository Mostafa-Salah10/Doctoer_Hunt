import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class AppointmentCardButtons extends StatelessWidget {
  const AppointmentCardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.primaryColor),

                borderRadius: BorderRadius.circular(6),
              ),

              child: Center(
                child: Text(
                  "View Details",
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),

        1 + 1 == 2
            ? Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.errorColor),
                      color: AppColors.errorColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),

                    child: Center(
                      child: Text(
                        "Cancel Appointment",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: AppColors.errorColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Expanded(
                child: AppButton(text: "Rate Doctor", onPressed: () {}),
              ),
      ],
    );
  }
}
