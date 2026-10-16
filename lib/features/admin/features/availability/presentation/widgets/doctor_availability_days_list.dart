import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/availability/data/models/doctor_working_day_model.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/manager/doctor_availability_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DoctorAvailabilityDaysList extends StatelessWidget {
  const DoctorAvailabilityDaysList({super.key, required this.workingDays});

  final List<DoctorWorkingDayModel> workingDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: 0,
            blurRadius: 10,
            color: AppColors.blackColor.withValues(alpha: 0.051),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),

        itemCount: workingDays.length,
        separatorBuilder: (context, index) => const VerticalSpace(height: 12),
        itemBuilder: (context, index) =>
            DoctorAvailabilityDayItem(day: workingDays.elementAt(index)),
      ),
    );
  }
}

class DoctorAvailabilityDayItem extends StatefulWidget {
  const DoctorAvailabilityDayItem({super.key, required this.day});

  final DoctorWorkingDayModel day;

  @override
  State<DoctorAvailabilityDayItem> createState() =>
      _DoctorAvailabilityDayItemState();
}

class _DoctorAvailabilityDayItemState extends State<DoctorAvailabilityDayItem> {
  late final ValueNotifier<bool> isActive;

  @override
  void initState() {
    isActive = ValueNotifier(widget.day.isActive);
    super.initState();
  }

  @override
  void dispose() {
    isActive.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isActive,
      builder: (context, value, child) {
        return Row(
          children: [
            SvgPicture.asset(
              width: 35,
              widget.day.isActive
                  ? Assets.assetsSvgsActiveAvailability
                  : Assets.assetsSvgsInactiveAvailability,
            ),

            const HorizontalSpace(width: 8),
            Text(
              widget.day.weekday.localizedName(context),
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.isDarkMode
                    ? AppColors.lightBackgroundColor
                    : AppColors.blackColor,
              ),
            ),

            const Spacer(),

            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                inactiveThumbColor: AppColors.lightBackgroundColor,
                inactiveTrackColor: AppColors.greyColor.withValues(alpha: 0.2),
                activeTrackColor: AppColors.primaryColor,
                value: value ? true : false,
                onChanged: (value) {
                  isActive.value = value;
                  context.read<DoctorAvailabilityCubit>().toggleDayAvailability(
                    widget.day,
                    value,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
