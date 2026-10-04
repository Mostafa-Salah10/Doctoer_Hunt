import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/booking/presentation/manager/select_time_cubit.dart';
import 'package:doctor_hunt/features/booking/presentation/widgets/select_time_data_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDayDataWithTitle extends StatelessWidget {
  const SelectDayDataWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
                buildWhen: (previous, current) =>
                    previous.currenDaytIndex != current.currenDaytIndex,
                builder: (context, state) {
                  return Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    DateTimeHelper.formatDate(
                      state
                          .availableDaysState
                          .data![state.currenDaytIndex]
                          .availableDay,
                    ),
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.isDarkMode
                          ? AppColors.lightBackgroundColor
                          : AppColors.blackColor,
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
              buildWhen: (previous, current) =>
                  previous.currenAfterNoontIndex !=
                      current.currenAfterNoontIndex ||
                  previous.afternoonSlots != current.afternoonSlots,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    VerticalSpace(
                      height: state.afternoonSlots.isEmpty ? 0 : 33,
                    ),
                    SelectTimeDataList(
                      selectedIndex: state.currenAfterNoontIndex,
                      data: state.afternoonSlots
                          .where((element) => element.isBooked == false)
                          .toList(),
                      title: 'Afternoon ${state.afternoonSlots.length} slots',
                      onTap: (index) {
                        context
                            .read<SelectTimeCubit>()
                            .changeSelectedAfterNoonTime(index);
                      },
                    ),
                  ],
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
              buildWhen: (previous, current) =>
                  previous.currenEveningtIndex != current.currenEveningtIndex ||
                  previous.eveningSlots != current.eveningSlots,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(height: state.eveningSlots.isEmpty ? 0 : 33),
                    SelectTimeDataList(
                      selectedIndex: state.currenEveningtIndex,
                      data: state.eveningSlots
                          .where((element) => element.isBooked == false)
                          .toList(),
                      title: 'Evening ${state.eveningSlots.length} slots',
                      onTap: (index) {
                        context
                            .read<SelectTimeCubit>()
                            .changeSelectedEveningTime(index);
                      },
                    ),
                  ],
                );
              },
            ),
          ),

          // Image.asset(Assets.assetsImagesNoSlots),
        ],
      ),
    );
  }
}
