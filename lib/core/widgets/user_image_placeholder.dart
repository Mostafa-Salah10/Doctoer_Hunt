import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/upper_lower_extension.dart';
import 'package:flutter/material.dart';

class UserImagePlaceholder extends StatelessWidget {
  const UserImagePlaceholder({
    super.key,
    required this.width,
    required this.height,
    required this.name,
  });

  final double width;
  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          name.initials,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: height * 0.3,
          ),
        ),
      ),
    );
  }
}
