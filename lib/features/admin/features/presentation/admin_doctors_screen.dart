import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        
        
        // AdminAppBar()
        
        
        
        
        ])),
    );
  }
}

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.suffixIcon,
    this.leadingAction,
    this.suffixAction,
  });

  final String title;
  final String leadingIcon;
  final String? suffixIcon;
  final VoidCallback? leadingAction;
  final VoidCallback? suffixAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13.r),
          topRight: Radius.circular(13.r),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            leadingIcon,
            height: 20.h,
            width: 20.w,
            colorFilter: ColorFilter.mode(
              AppColors.lightBackgroundColor,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
