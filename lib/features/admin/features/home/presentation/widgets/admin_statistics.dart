import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class AdminStatistics extends StatelessWidget {
  const AdminStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildAdminStatisticsCard("Total Doctors", "12", context),
        ),
        const HorizontalSpace(width: 5),
        Expanded(child: _buildAdminStatisticsCard("Active", "10", context)),
      ],
    );
  }

  Widget _buildAdminStatisticsCard(
    String title,
    String value,
    BuildContext context,
  ) {
    return Card(
      color: context.isDarkMode
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person_outline, color: AppColors.primaryColor),
            ),

            const HorizontalSpace(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      value,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
