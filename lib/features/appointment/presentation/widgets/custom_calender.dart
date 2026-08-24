import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),

      focusedDay: _focusedDay,

      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },

      headerStyle: _buildHeaderStyle(context),

      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: context.textTheme.bodyMedium!,
        weekendStyle: context.textTheme.bodyMedium!,
      ),

      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,

        defaultTextStyle: context.textTheme.bodyMedium!,

        weekendTextStyle: context.textTheme.bodyMedium!,

        selectedDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),

        selectedTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        todayDecoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),

        todayTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        cellMargin: const EdgeInsets.all(4),
      ),

      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          final text = [
            'SU',
            'MO',
            'TU',
            'WE',
            'TH',
            'FR',
            'SA',
          ][day.weekday % 7];

          return Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  HeaderStyle _buildHeaderStyle(BuildContext context) {
    return HeaderStyle(
      headerMargin: const EdgeInsets.only(bottom: 13),

      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(11.r),
          topRight: Radius.circular(11.r),
        ),
      ),

      titleTextStyle: context.textTheme.bodyLarge!.copyWith(
        color: AppColors.lightBackgroundColor,
        fontWeight: FontWeight.bold,
      ),

      formatButtonVisible: false,

      titleCentered: false,

      leftChevronIcon: Icon(
        Icons.chevron_left,
        color: AppColors.lightBackgroundColor,
      ),

      rightChevronIcon: Icon(
        Icons.chevron_right,
        color: AppColors.lightBackgroundColor,
      ),

      headerPadding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 2.h),
    );
  }
}
