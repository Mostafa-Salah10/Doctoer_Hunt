import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.lightBackgroundColor,
    this.style,
    this.height,
    this.shape,
    this.elevation = 1,
    this.splashColor,
    this.child,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final TextStyle? style;
  final double? height;
  final ShapeBorder? shape;
  final Color? textColor;
  final double? elevation;
  final Color? splashColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: splashColor,
      elevation: elevation,
      textColor: textColor,
      minWidth: double.infinity,
      height: height ?? 54.h,
      disabledColor: AppColors.primaryColor.withValues(alpha: 0.1),
      onPressed: onPressed,
      color: color,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child:
          child ??
          Text(text ?? "", style: style ?? context.textTheme.titleMedium),
    );
  }
}
