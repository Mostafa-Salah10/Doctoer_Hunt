import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/custom_log_out_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/widgets/admin_settings_second_card.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/widgets/admin_settings_top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        title: Text("Settings"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              Assets.assetsImagesSettingsTopAction,
              height: 45,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColorLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const VerticalSpace(height: 15),
              const AdminSettingsTopCard(),
              const VerticalSpace(height: 15),

              const AdminSettingsSecondCard(),

              const VerticalSpace(height: 40),
              const CustomLogoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
