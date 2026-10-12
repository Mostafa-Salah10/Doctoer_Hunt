import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/core/widgets/ustom_admin_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileForm extends StatelessWidget {
  const AdminEditProfileForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.locationController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController locationController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(height: 20),
          CustomAdminTextField(
            hint: 'Enter your full name',
            label: 'Full name',
            controller: nameController,
            keyboardType: TextInputType.name,
            prefixIcon: Icon(
              Icons.person_outline,
              size: 24.sp,
              color: const Color(0xFF8DA0BB),
            ),
            validator: (name) =>
                AppValidators.required(name, fieldName: "Name"),
          ),
          SizedBox(height: 20.h),
          CustomAdminTextField(
            hint: 'Enter your email address',
            label: 'Email address',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            readOnly: true,
            enabled: false,
            prefixIcon: Icon(
              Icons.mail_outline,
              size: 24.sp,
              color: const Color(0xFF8DA0BB),
            ),
            validator: (email) => AppValidators.email(email),
          ),
          SizedBox(height: 20.h),
          CustomAdminTextField(
            hint: 'Enter your clinic location',
            label: 'CLINIC LOCATION',
            controller: locationController,
            keyboardType: TextInputType.streetAddress,
            validator: (clinic) =>
                AppValidators.required(clinic, fieldName: "clinic location"),
          ),
        ],
      ),
    );
  }
}
