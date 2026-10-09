import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSettingsTopCard extends StatelessWidget {
  const AdminSettingsTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      tileColor: AppColors.lightBackgroundColor,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      leading: Container(
        clipBehavior: Clip.hardEdge,
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(Assets.assetsImagesAppointment),
      ),

      title: Text("Administrator"),

      subtitle: Text(
        style: context.textTheme.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,

        'admin@doctorhunt.com',
      ),
    );
  }
}
