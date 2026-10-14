import 'dart:io';

import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/functions/pick_image_from_device.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileImageWidget extends StatelessWidget {
  const UpdateProfileImageWidget({super.key, this.image, required this.onTap});
  final File? image;
  final ValueChanged<File?> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Center(
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(shape: BoxShape.circle),

            child: image != null
                ? Image.file(image!, fit: BoxFit.cover)
                : Image.asset(Assets.assetsImagesAddImage, fit: BoxFit.cover),
          ),
        ),

        InkWell(
          onTap: () async {
            final image = await pickImageFromDevice();

            onTap(image);
          },
          child: Text(
            "Add Image",
            style: context.textTheme.bodyLarge!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
