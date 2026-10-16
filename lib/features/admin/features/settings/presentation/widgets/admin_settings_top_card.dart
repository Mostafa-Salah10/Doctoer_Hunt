import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/user_image_placeholder.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminSettingsTopCard extends StatelessWidget {
  const AdminSettingsTopCard({super.key, this.admin});

  final AdminModel? admin;

  @override
  Widget build(BuildContext context) {
    final isLoading = admin == null;
    final imageUrl = admin?.imageUrl ?? '';

    return Skeletonizer(
      enabled: isLoading,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        tileColor: AppColors.lightBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: SizedBox(
          width: 60.w,
          height: 60.w,
          child: ClipOval(
            child: isLoading
                ? const Bone.circle(size: 60)
                : imageUrl.isNotEmpty
                    ? CustomCachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                      )
                    : UserImagePlaceholder(
                        width: 60.w,
                        height: 60.w,
                        name: admin?.name ?? '',
                      ),
          ),
        ),
        title: const Text('Administrator'),
        subtitle: Text(
          admin?.email ?? 'admin@email.com',
          style: context.textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}