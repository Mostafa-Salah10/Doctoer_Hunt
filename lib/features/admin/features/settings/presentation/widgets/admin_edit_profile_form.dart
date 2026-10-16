import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/core/widgets/ustom_admin_text_field.dart';
import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/manager/admin_settings_cubit.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileForm extends StatefulWidget {
  const AdminEditProfileForm({super.key, required this.admin});
  final AdminModel admin;

  @override
  State<AdminEditProfileForm> createState() => _AdminEditProfileFormState();
}

class _AdminEditProfileFormState extends State<AdminEditProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = '';

  @override
  void initState() {
    name = widget.admin.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdminSettingsCubit>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(height: 20),
          CustomAdminTextField(
            initialValue: name,
            onChanged: (n) {
              name = n;
            },
            hint: context.t.enterYourFullName,
            label: context.t.fullName,
            keyboardType: TextInputType.name,
            prefixIcon: Icon(
              Icons.person_outline,
              size: 24.sp,
              color: const Color(0xFF8DA0BB),
            ),
            validator: (name) => AppValidators.required(
              context,
              name,
              fieldName: context.t.fullName,
            ),
          ),
          SizedBox(height: 20.h),
          CustomAdminTextField(
            initialValue: widget.admin.email,
            hint: context.t.enterYourEmailAddress,
            readOnly: true,
            prefixIcon: Icon(
              Icons.mail_outline,
              size: 24.sp,
              color: const Color(0xFF8DA0BB),
            ),
            validator: (email) => AppValidators.email(context, email),
          ),
          SizedBox(height: 20.h),
          // CustomAdminTextField(
          //   onChanged: (l) {
          //     location = l;
          //   },
          //   hint: 'Enter your clinic location',
          //   label: 'CLINIC LOCATION',
          //   keyboardType: TextInputType.streetAddress,
          //   validator: (clinic) =>
          //       AppValidators.required(clinic, fieldName: "clinic location"),
          // ),

          const Spacer(),
          BlocConsumer<AdminSettingsCubit, AdminSettingsState>(
            buildWhen: (previous, current) =>
                previous.updateCurrentAdmin != current.updateCurrentAdmin,
            listener: (context, state) {
              if (state.updateCurrentAdmin.isError) {
                toastAlert(
                  msg: context.t.somethingWentWrong,
                  color: AppColors.errorColor,
                );
              } else if (state.updateCurrentAdmin.isSuccess) {
                context.pop();
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state.updateCurrentAdmin.isLoading
                    ? context.t.loading
                    : context.t.saveChanges,
                onPressed: () {
                  if (state.updateCurrentAdmin.isLoading) return;

                  if (_formKey.currentState!.validate()) {
                    cubit.updateCurrentAdmin(
                      AdminModel(
                        adminId: widget.admin.adminId,
                        imageUrl: widget.admin.imageUrl,
                        email: widget.admin.email,
                        name: name,
                        image: cubit.state.profileImage,
                      ),
                    );
                  }
                },
              );
            },
          ),
          const VerticalSpace(height: 20),
        ],
      ),
    );
  }
}
