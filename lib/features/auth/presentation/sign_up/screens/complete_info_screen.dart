import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/core/widgets/update_profile_image_widget.dart';
import 'package:doctor_hunt/core/widgets/when_pop_screen.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/complete_info_form.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteInfoScreen extends StatelessWidget {
  const CompleteInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WhenPopScreen(
      child: Scaffold(
        backgroundColor: AppColors.primaryColorLight,

        appBar: AppBar(
          title: Text(context.t.completeProfile),
          centerTitle: true,
          backgroundColor: AppColors.primaryColorLight,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const VerticalSpace(height: 30),
                BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.profileImage != current.profileImage,
                  builder: (context, state) {
                    return UpdateProfileImageWidget(
                      image: state.profileImage,
                      onTap: (image) {
                        if (image != null) {
                          context.read<SignUpCubit>().setProfileImage(image);
                        }
                      },
                    );
                  },
                ),
                Expanded(child: CompelteInfoForm()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
