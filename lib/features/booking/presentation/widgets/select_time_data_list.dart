import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/features/booking/data/models/slot_model.dart';
import 'package:doctor_hunt/features/booking/presentation/widgets/select_time_data_item.dart';
import 'package:flutter/material.dart';

class SelectTimeDataList extends StatelessWidget {
  const SelectTimeDataList({
    super.key,
    required this.data,
    required this.title,
    required this.onTap,
    required this.selectedIndex,
  });

  final List<SlotModel> data;
  final String title;
  final int selectedIndex;

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const SizedBox.shrink()
        : Column(
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
                  ...List.generate(data.length, (index) {
                    return InkWell(
                      onTap: () {
                        onTap(index);
                      },
                      child: SelectTimeDataItem(
                        time: data[index].id,
                        isSelected: index == selectedIndex,
                      ),
                    );
                  }),
                ],
              ),
            ],
          );
  }
}
