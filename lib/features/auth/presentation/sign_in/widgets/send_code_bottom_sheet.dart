import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/widgets/custom_otp_field.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/widgets/reset_password_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendCodeBottomSheet extends StatefulWidget {
  const SendCodeBottomSheet({super.key});

  @override
  State<SendCodeBottomSheet> createState() => _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<SendCodeBottomSheet> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),

      child: Form(
        key: cubit.sendCodeFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: AppColors.greyBorderColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),

              const VerticalSpace(height: 55),
              Text(
                "Enter 4 Digits Code",
                style: context.textTheme.displayLarge,
              ),
              const VerticalSpace(height: 12),
              Text(
                "Enter the 4 digits code that you received on\nyour email.",
                style: context.textTheme.titleSmall,
              ),
              const VerticalSpace(height: 27),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomOtpField(),
              ),

              const VerticalSpace(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton(
                  text: "Continue",
                  onPressed: () {
                    // if (cubit.sendCodeFormKey.currentState!.validate()) {
                    //   ///TODO: forgot password
                    // }
                    context.pop();

                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (context) => BlocProvider.value(
                        value: gi<SignInCubit>(),
                        child: ResetPasswordBottomSheet(
                          email: "mostafa@gmail.com",
                        ),
                      ),
                    );
                  },
                ),
              ),
              const VerticalSpace(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
