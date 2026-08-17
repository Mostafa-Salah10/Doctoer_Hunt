import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.borderRadius,
    this.validator,
    this.onChanged,
    this.intialValue,
    this.keyboardType,
    this.minLine,
    this.maxLine,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.style,
    this.contentPadding,
    this.fillColor,
    this.withBorder = true,
  });
  final String hint;
  final String? label;
  final String? intialValue;
  final TextEditingController? controller;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? minLine;
  final int? maxLine;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool? withBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      initialValue: intialValue,
      keyboardType: keyboardType,
      minLines: minLine,
      maxLines: maxLine ?? 1,
      controller: controller,
      obscureText: obscureText ?? false,
      cursorColor: AppColors.greyTextColor,
      validator: validator,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ??getFillColor(context) ,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 25.w, vertical: 18.h),
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorBorder: _buildBorder(color: AppColors.errorColor),
        enabledBorder: OutlineInputBorder(
          borderSide: withBorder == true
              ? BorderSide(
                  color: AppColors.greyTextColor.withValues(alpha: 0.16),
                  width: 1,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: _buildBorder(color: AppColors.primaryColor),
        focusedErrorBorder: _buildBorder(color: AppColors.errorColor),
      ),
    );
  }

  OutlineInputBorder _buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(12.r),
    );
  }


  Color getFillColor(BuildContext context)=> context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor;
}
