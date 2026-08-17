import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordBottomSheet> createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  String newPassword = "";
  String reEnterPassword = "";
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
        key: cubit.resetFormKey,
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
              Text("Reset Password", style: context.textTheme.displayLarge),
              const VerticalSpace(height: 12),
              Text(
                "Set the new password for your account so you can\n login and access all the features.",
                style: context.textTheme.titleSmall,
              ),
              const VerticalSpace(height: 36),
              BlocBuilder<SignInCubit, SignInState>(
                buildWhen: (previous, current) =>
                    previous.showNewPassword != current.showNewPassword,
                builder: (context, state) {
                  return AppTextFormField(
                    hint: "New Password",
                    validator: (value) => AppValidators.password(value),
                    onChanged: (value) => newPassword = value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.greyColor,
                      ),
                      onPressed: () =>
                          context.read<SignInCubit>().toggleNewPasswordIcon(),
                    ),
                    obscureText: !state.showNewPassword,
                  );
                },
              ),
              const VerticalSpace(height: 18),
              BlocBuilder<SignInCubit, SignInState>(
                buildWhen: (previous, current) =>
                    previous.showReEnterPassword != current.showReEnterPassword,
                builder: (context, state) {
                  return AppTextFormField(
                    hint: "Re Enter Password",
                    validator: (value) => AppValidators.password(value),
                    onChanged: (value) => reEnterPassword = value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.greyColor,
                      ),
                      onPressed: () => context
                          .read<SignInCubit>()
                          .toggleReEnterPasswordIcon(),
                    ),
                    obscureText: !state.showReEnterPassword,
                  );
                },
              ),
              const VerticalSpace(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton(
                  text: "Update Password",
                  onPressed: () {
                    if (cubit.resetFormKey.currentState!.validate()) {}
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
