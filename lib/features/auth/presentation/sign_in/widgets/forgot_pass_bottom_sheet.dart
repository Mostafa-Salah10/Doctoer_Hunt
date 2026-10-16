import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
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
              Text(
                context.t.forgotPassword,
                style: context.textTheme.displayLarge,
              ),
              const VerticalSpace(height: 12),
              Text(
                context.t.enterEmailVerificationDescription,
                style: context.textTheme.titleSmall,
              ),
              const VerticalSpace(height: 36),
              BlocBuilder<SignInCubit, SignInState>(
                buildWhen: (previous, current) =>
                    previous.forgotPassValidEmail !=
                    current.forgotPassValidEmail,
                builder: (context, state) {
                  return AppTextFormField(
                    hint: context.t.email,
                    validator: (value) => AppValidators.email(context, value),
                    onChanged: (value) {
                      cubit.validateForgotPassEmail(value);
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
                child: BlocConsumer<SignInCubit, SignInState>(
                  buildWhen: (previous, current) =>
                      current.resetPassword != previous.resetPassword,
                  listenWhen: (previous, current) =>
                      current.resetPassword != previous.resetPassword,
                  listener: (context, state) {
                    if (state.resetPassword.isSuccess) {
                      context.pop();
                      toastAlert(
                        msg: context.t.checkYourEmail,
                        color: AppColors.primaryColor,
                      );
                      context.pop();
                    } else if (state.resetPassword.isError) {
                      toastAlert(
                        msg: state.resetPassword.error!,
                        color: AppColors.errorColor,
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: state.resetPassword.isLoading
                          ? context.t.sending
                          : context.t.continueAction,
                      onPressed: () {
                        // showModalBottomSheet(
                        //   isDismissible: false,
                        //   context: context,
                        //   builder: (context) => BlocProvider.value(
                        //     value: gi<SignInCubit>(),
                        //     child: SendCodeBottomSheet(),
                        //   ),
                        // );

                        if (state.resetPassword.isLoading) return;
                        cubit.resetPassword(email: email);
                      },
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
