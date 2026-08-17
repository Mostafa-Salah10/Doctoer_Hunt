import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AuthSocialSection extends StatelessWidget {
  const AuthSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthSocialContainer(
            title: "Google",
            icon: Assets.assetsSvgsGoogle,
          ),
        ),
        const HorizontalSpace(width: 14),
        Expanded(
          child: AuthSocialContainer(
            title: "Facebook",
            icon: Assets.assetsSvgsFacebook,
          ),
        ),
      ],
    );
  }
}

class AuthSocialContainer extends StatelessWidget {
  const AuthSocialContainer({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: const Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 22,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, height: 18.17.h, width: 18.17.h),
          const HorizontalSpace(width: 7),
          Text(title, style: context.textTheme.titleSmall),
        ],
      ),
    );
  }
}
