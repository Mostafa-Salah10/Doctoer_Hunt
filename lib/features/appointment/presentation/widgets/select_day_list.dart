import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/select_time_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/select_day_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDayList extends StatelessWidget {
  const SelectDayList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const HorizontalSpace(width: 20),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.read<SelectTimeCubit>().changeSelectedDay(index);
          },
          child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
            buildWhen: (previous, current) =>
                previous.currenDaytIndex != current.currenDaytIndex,
            builder: (context, state) {
              return SelectDayListItem(isSelected: state.currenDaytIndex == index);
            },
          ),
        ),
      ),
    );
  }
}
