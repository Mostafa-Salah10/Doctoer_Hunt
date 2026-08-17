import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/widgets/send_code_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  State<ForgotPasswordBottomSheet> createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
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
        key: cubit.forgotFormKey,
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
              Text("Forgot password", style: context.textTheme.displayLarge),
              const VerticalSpace(height: 12),
              Text(
                "Enter your email for the verification proccesss,\n we will send 4 digits code to your email.",
                style: context.textTheme.titleSmall,
              ),
              const VerticalSpace(height: 36),
              BlocBuilder<SignInCubit, SignInState>(
                buildWhen: (previous, current) =>
                    previous.forgotPassValidEmail !=
                    current.forgotPassValidEmail,
                builder: (context, state) {
                  return AppTextFormField(
                    hint: "Email",
                    validator: (value) => AppValidators.email(value),
                    onChanged: (value) {
                      cubit.validateEmail(value);
                      email = value;
                    },
                    suffixIcon: state.forgotPassValidEmail
                        ? Icon(Icons.done, color: AppColors.greyColor)
                        : null,
                  );
                },
              ),
              const VerticalSpace(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton(
                  text: "Continue",
                  onPressed: () {
                    // if (cubit.forgotFormKey.currentState!.validate()) {
                    //   ///TODO: forgot password
                    // }

                    context.pop();

                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (context) => BlocProvider.value(
                        value: gi<SignInCubit>(),
                        child: SendCodeBottomSheet(),
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
