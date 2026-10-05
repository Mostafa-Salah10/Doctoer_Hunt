import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/addtional_settings_list.dart';
import 'package:doctor_hunt/features/settings/presentation/widgets/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

              const SettingCard(),

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

              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                      backgroundColor: context.isDarkMode
                          ? AppColors.darkBackgroundColor
                          : AppColors.lightBackgroundColor,

                      child: SizedBox(
                        width: 335.w,
                        height: 167.h,

                        child: Padding(
                          padding: const EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Log Out",
                                style: context.textTheme.headlineSmall,
                              ),

                              const VerticalSpace(height: 15),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "Are you sure you want to logout?",
                                style: context.textTheme.bodyLarge,
                              ),

                              const VerticalSpace(height: 20),

                              Row(
                                spacing: 25,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      "Cancel",
                                      style: context.textTheme.bodyLarge!
                                          .copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await SharedPreferencesHelper().remove(
                                        key: AppStrings.role,
                                      );
                                      if (!context.mounted) return;
                                      context.pop();

                                      context.pushNamedAndRemoveUntil(
                                        AppRoutes.signIn,
                                      );
                                    },
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      "ok",
                                      style: context.textTheme.bodyLarge!
                                          .copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Image.asset(Assets.assetsImagesLogoutButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
