import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();

    final baseTheme = PinTheme(
      width: 54.w,
      height: 54.w,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: AppColors.primaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1,
          color: AppColors.primaryColor,
        ),
      ),
    );

    return Pinput(
      length: 4,
      autofocus: false,
      autofillHints: const [],

      defaultPinTheme: baseTheme,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter the OTP code';
        }

        if (value.length != 4) {
          return 'OTP must be 4 digits';
        }

        return null;
      },

      errorPinTheme: baseTheme.copyWith(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.5,
            color: Colors.red,
          ),
        ),
      ),

      errorTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.red,
      ),

      onChanged: (code) {
        cubit.otpCode = code;
      },

      onCompleted: (code) {
        cubit.otpCode = code;
      },

      focusedPinTheme: baseTheme.copyWith(
        decoration: baseTheme.decoration!.copyWith(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
          border: Border.all(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
      ),

      submittedPinTheme: baseTheme.copyWith(
        decoration: baseTheme.decoration!.copyWith(
          color: AppColors.primaryColor.withValues(alpha: 0.15),
          border: Border.all(
            width: 1.5,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}