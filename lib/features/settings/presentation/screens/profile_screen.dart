import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/profile_fields.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/profile_top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      withHorizontalPadding: false,
      child: Column(
        children: [
          const ProfileTopCard(),
          const VerticalSpace(height: 15),
          const ProfileFields(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                AppButton(text: "Confirm", onPressed: () {}),

                const VerticalSpace(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
