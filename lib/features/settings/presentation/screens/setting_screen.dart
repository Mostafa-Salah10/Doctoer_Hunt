import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_log_out_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/addtional_settings_list.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/setting_card.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomScreensAppBar(
                title: "Settings",
                showBackButton: false,
              ),

              const VerticalSpace(height: 34),

              InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.profileScreen);
                },

                child: const SettingCard(),
              ),

              const VerticalSpace(height: 10),
              Text(
                "Account settings",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),

              const VerticalSpace(height: 20),
              const AddtionalSettingsList(),
              const VerticalSpace(height: 20),
              Text(
                "More options",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),

              const VerticalSpace(height: 20),

              Image.asset(Assets.assetsImagesLanguage),

              Image.asset(Assets.assetsImagesVersions),
              const VerticalSpace(height: 53),

              const CustomLogoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
