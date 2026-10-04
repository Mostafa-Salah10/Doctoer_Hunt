import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/select_time_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/select_time_data_list.dart';
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
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "Today, 23 Feb",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.isDarkMode
                      ? AppColors.lightBackgroundColor
                      : AppColors.blackColor,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: VerticalSpace(height: 33)),

          SliverToBoxAdapter(
            child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
              buildWhen: (previous, current) =>
                  previous.currenAfterNoontIndex !=
                  current.currenAfterNoontIndex,
              builder: (context, state) {
                return SelectTimeDataList(
                  data: [],
                  title: 'Afternoon 7 slots',
                  onTap: (index) {
                    context.read<SelectTimeCubit>().changeSelectedAfterNoonTime(
                      index,
                    );
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: VerticalSpace(height: 33)),

          SliverToBoxAdapter(
            child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
              buildWhen: (previous, current) =>
                  previous.currenEveningtIndex != current.currenEveningtIndex,
              builder: (context, state) {
                return SelectTimeDataList(
                  data: [],
                  title: 'Evening 5 slots',
                  onTap: (index) {
                    context.read<SelectTimeCubit>().changeSelectedEveningTime(
                      index,
                    );
                  },
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
