import 'dart:io';

import 'package:doctor_hunt/core/functions/pick_image_from_device.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/core/widgets/user_image_placeholder.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/manager/admin_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminSetttingsTopChangeProfileImage extends StatelessWidget {
  const AdminSetttingsTopChangeProfileImage({
    super.key,
    required this.admin,
    this.image,
  });

  final AdminModel admin;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 20),
        Center(
          child: Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(shape: BoxShape.circle),

            child: Stack(
              children: [
                image != null
                    ? Image.file(image!)
                    : admin.imageUrl.isNotEmpty
                    ? CustomCachedNetworkImage(
                        imageUrl: admin.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : UserImagePlaceholder(
                        width: 120.w,
                        height: 120.w,
                        name: admin.name,
                      ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () async {
                      final image = await pickImageFromDevice();
                      if (image != null) {
                        if (!context.mounted) return;
                        context.read<AdminSettingsCubit>().chooseProfileImage(
                          image,
                        );
                      }
                    },
                    child: Image.asset(
                      Assets.assetsImagesAdminCamera,
                      height: 40.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const VerticalSpace(height: 5),
        InkWell(
          onTap: () async {
            final image = await pickImageFromDevice();
            if (image != null) {
              if (!context.mounted) return;
              context.read<AdminSettingsCubit>().chooseProfileImage(image);
            }
          },
          child: Image.asset(Assets.assetsImagesTapPhoto, width: 120.w),
        ),
      ],
    );
  }
}
