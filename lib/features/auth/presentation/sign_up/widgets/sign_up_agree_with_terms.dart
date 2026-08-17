import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpAgreeWithTerms extends StatelessWidget {
  const SignUpAgreeWithTerms({
    super.key,
    required this.isChecked,
    this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: isChecked,
      validator: (value) {
        if (value != true) {
          return 'You must agree to the terms';
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryColor,

                  value: field.value ?? false,
                  onChanged: (value) {
                    field.didChange(value);

                    onChanged?.call(value);
                  },
                ),
                Expanded(
                  child: Text(
                    "I agree with the Terms of Service & Privacy Policy",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall!.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),

            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  field.errorText!,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.errorColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
