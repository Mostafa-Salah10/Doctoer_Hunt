import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/functions/pick_image_from_device.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/settings/presentation/manager/settings_cubit.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTopCard extends StatelessWidget {
  const ProfileTopCard({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 236.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),

        color: AppColors.primaryColor,
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SafeArea(
              child: CustomScreensAppBar(
                title: context.t.profile,
                isLight: true,
              ),
            ),

            BlocBuilder<SettingsCubit, SettingsState>(
              buildWhen: (previous, current) =>
                  previous.profileImage != current.profileImage,
              builder: (context, state) {
                return Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: 130.w,
                          height: 130.w,
                          decoration: BoxDecoration(shape: BoxShape.circle),

                          child: state.profileImage != null
                              ? Image.file(
                                  state.profileImage!,
                                  fit: BoxFit.cover,
                                )
                              : CustomCachedNetworkImage(
                                  imageUrl: imageUrl,
                                  fit: BoxFit.cover,
                                ),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () async {
                              final image = await pickImageFromDevice();
                              if (image != null) {
                                if (!context.mounted) return;
                                context
                                    .read<SettingsCubit>()
                                    .chooseProfileImage(image);
                              }
                            },
                            child: Image.asset(
                              Assets.assetsImagesCamera,
                              width: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const VerticalSpace(height: 20),
          ],
        ),
      ),
    );
  }
}
