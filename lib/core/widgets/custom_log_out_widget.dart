import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogoutWidget extends StatelessWidget {
  const CustomLogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
