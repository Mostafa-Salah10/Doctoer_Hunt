import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeTopAppBar extends StatelessWidget {
  const HomeTopAppBar({super.key, this.patient});

  final PatientModel? patient;

  @override
  Widget build(BuildContext context) {
    final isLoading = patient == null;

    return Skeletonizer(
      enabled: isLoading,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        context.t.greeting(
                          name: patient?.name ?? context.t.patientUser,
                        ),
                        style: context.textTheme.labelSmall,
                      ),
                    ),
                    const VerticalSpace(height: 8),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        context.t.findYourDoctor,
                        style: context.textTheme.headlineSmall!.copyWith(
                          color: AppColors.lightBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightBackgroundColor,
                ),
                clipBehavior: Clip.antiAlias,
                child: isLoading
                    ? const Bone.circle(size: 60)
                    : CustomCachedNetworkImage(
                        imageUrl: patient!.imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
