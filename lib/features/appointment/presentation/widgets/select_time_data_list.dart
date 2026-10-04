import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/select_time_data_item.dart';
import 'package:flutter/material.dart';

class SelectTimeDataList extends StatelessWidget {
  const SelectTimeDataList({
    super.key,
    required this.data,
    required this.title,
    required this.onTap,
  });

  final List data;
  final String title;

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          title,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.isDarkMode
                ? AppColors.lightBackgroundColor
                : AppColors.blackColor,
          ),
        ),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...List.generate(7, (index) {
              return InkWell(
                onTap: () {
                  onTap(index);
                },
                child: SelectTimeDataItem(
                  isSelected: index == 1,
                  index: index + 1,
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
