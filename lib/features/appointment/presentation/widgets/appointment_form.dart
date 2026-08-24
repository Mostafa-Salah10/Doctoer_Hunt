import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentFrom extends StatelessWidget {
  const AppointmentFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hint: "Patient Name",
          border: _buildBorder(),
          style: context.textTheme.titleSmall,
        ),
        const VerticalSpace(height: 20),
        AppTextFormField(
          hint: "Contact Number",
          style: context.textTheme.titleSmall,

          border: _buildBorder(),
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(
        color: AppColors.greyBorderColorAppoitment.withValues(alpha: 0.12),
        width: 1,
      ),
    );
  }
}