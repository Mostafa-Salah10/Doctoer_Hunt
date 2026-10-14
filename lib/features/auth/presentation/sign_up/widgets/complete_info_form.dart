import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/core/widgets/ustom_admin_text_field.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompelteInfoForm extends StatelessWidget {
  CompelteInfoForm({super.key});
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String phone = '';
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: _formState,

      child: Column(
        children: [
          const VerticalSpace(height: 20),
          CustomAdminTextField(
            onChanged: (ph) {
              phone = ph;
            },
            hint: 'ex : 01006828614',
            label: 'Contact Number',
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Icons.phone_iphone_outlined,
              size: 24.sp,
              color: const Color(0xFF8DA0BB),
            ),
            validator: (name) =>
                AppValidators.required(name, fieldName: "Phone"),
          ),
          const Spacer(),
          BlocConsumer<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) =>
                previous.completeInfo != current.completeInfo,
            listener: (context, state) {
              if (state.completeInfo.isError) {
                toastAlert(
                  msg: "Something went wrong",
                  color: AppColors.errorColor,
                );
              } else if (state.completeInfo.isSuccess) {
                context.pushNamedAndRemoveUntil(AppRoutes.signIn);
              }
            },
            builder: (context, state) {
              return AppButton(
                onPressed: () {
                  if (state.signUp.isLoading) return;
                  if (cubit.state.profileImage == null) {
                    toastAlert(
                      msg: "Choose Profile Image",
                      color: AppColors.errorColor,
                    );

                    return;
                  }

                  if (_formState.currentState!.validate()) {
                    cubit.completeInfo(phone: phone);
                  }
                },
                text: state.completeInfo.isLoading ? "Loading..." : "Save",
              );
            },
          ),
          const VerticalSpace(height: 20),
        ],
      ),
    );
  }
}
