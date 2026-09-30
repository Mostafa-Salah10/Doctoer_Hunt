import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:flutter/material.dart';

class DoctorDetailsServicesSection extends StatelessWidget {
  DoctorDetailsServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      separatorBuilder: (context, index) => const Divider(height: 30),
      itemBuilder: (context, index) => Row(
        children: [
          Text(
            "${index + 1}.  ",
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              services.elementAt(index),
              style: context.textTheme.titleSmall!.copyWith(),
            ),
          ),
        ],
      ),
    );
  }

  final List<String> services = [
    "Patient care should be the number one priority.",
    "If you run your practiceyou know how frustrating.",
    "That’s why some of appointment reminder system.",
  ];
}
