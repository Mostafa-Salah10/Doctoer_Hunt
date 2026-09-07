import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSearchBar extends StatelessWidget {
  const AdminSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: AppColors.greyColor, size: 27),
            ),

            onChanged: (doctor) {},

            hint: 'Search doctors',
          ),
        ),

        const HorizontalSpace(width: 20),

        Container(
          height: 53.h,
          width: 53.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.greyColor, width: 0.3),
          ),
          child: Icon(Icons.filter_list, color: AppColors.greyColor),
        ),
      ],
    );
  }
}
