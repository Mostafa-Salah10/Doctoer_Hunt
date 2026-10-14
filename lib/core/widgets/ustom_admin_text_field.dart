import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdminTextField extends StatelessWidget {
  const CustomAdminTextField({
    super.key,
    required this.hint,
    this.controller,
    this.label,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.initialValue,
    this.enabled = true,
  });

  final String hint;
  final String? label;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      spacing: 10,
      children: [
        Text(label ?? '', style: context.textTheme.titleSmall),
        AppTextFormField(
          hint: hint,
          // label: label,
          controller: controller,
          intialValue: initialValue,
          prefixIcon: prefixIcon,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,

          fillColor: enabled ? Colors.white : const Color(0xFFF3F5F8),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),

          borderRadius: 14.r,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: const Color(0xFFE0E7F0), width: 1.w),
          ),
          withBorder: true,
        ),
      ],
    );
  }
}
