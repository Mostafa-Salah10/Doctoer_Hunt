import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileScreen extends StatelessWidget {
  const AdminEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),

      body: Column(
        children: [
          const VerticalSpace(height: 20),
          Center(
            child: Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(shape: BoxShape.circle),

              child: Stack(
                children: [
                  Image.asset(Assets.assetsImagesProfileContainer),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      Assets.assetsImagesAdminCamera,
                      height: 40.w,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const VerticalSpace(height: 5),
          Image.asset(Assets.assetsImagesTapPhoto,width: 120.w,),
        ],
      ),
    );
  }
}
