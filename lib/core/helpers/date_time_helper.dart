import 'package:doctor_hunt/core/enums/week_days.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDate(BuildContext context, String date) {
    final parsedDate = DateTime.parse(date);
    final now = DateTime.now();
    final locale = Localizations.localeOf(context).toString();

    final isToday =
        parsedDate.year == now.year &&
        parsedDate.month == now.month &&
        parsedDate.day == now.day;

    final formattedDate = DateFormat('d MMM', locale).format(parsedDate);
    return isToday
        ? context.t.todayDate(date: formattedDate)
        : DateFormat('EEE, d MMM', locale).format(parsedDate);
  }

  static String formatDateWithDayName(BuildContext context, String date) {
    final parsedDate = DateTime.parse(date);

    return DateFormat(
      'dd MMM yyyy',
      Localizations.localeOf(context).toString(),
    ).format(parsedDate);
  }

  static TimeOfDay formateTimeFromAMAndPM(String time) {
    final format = DateFormat('hh:mm a', 'en_US');
    final dateTime = format.parse(time.trim());
    return TimeOfDay.fromDateTime(dateTime);
  }

  static String formateTimeToAMAndPM(TimeOfDay time) {
    final dateTime = DateTime(2026, 1, 1, time.hour, time.minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String formatTimeForDisplay(BuildContext context, TimeOfDay time) {
    return MaterialLocalizations.of(context).formatTimeOfDay(time);
  }

  static String formateDateToRegularString(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatDuration(BuildContext context, int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;

    if (h == 0) {
      return m == 1
          ? context.t.oneMinuteDuration
          : context.t.minutesDuration(count: m);
    }
    if (m == 0) {
      return h == 1
          ? context.t.oneHourDuration
          : context.t.hoursDuration(count: h);
    }
    if (h == 1) {
      return context.t.oneHourAndMinutesDuration(minutes: m);
    }
    if (m == 1) {
      return context.t.hoursAndOneMinuteDuration(hours: h);
    }
    return context.t.hoursAndMinutesDuration(hours: h, minutes: m);
  }

  static TimeOfDay addMinutes(TimeOfDay time, int minutes) {
    final totalMinutes = time.hour * 60 + time.minute + minutes;

    return TimeOfDay(
      hour: (totalMinutes ~/ 60) % 24,
      minute: totalMinutes % 60,
    );
  }

  static DateTime getDateOfAnyNextDay(final Weekday day) {
    final today = DateTime.now();

    final weekdayMap = {
      Weekday.monday: DateTime.monday,
      Weekday.tuesday: DateTime.tuesday,
      Weekday.wednesday: DateTime.wednesday,
      Weekday.thursday: DateTime.thursday,
      Weekday.friday: DateTime.friday,
      Weekday.saturday: DateTime.saturday,
      Weekday.sunday: DateTime.sunday,
    };

    final targetWeekday = weekdayMap[day]!;
    final daysUntil = (targetWeekday - today.weekday) % 7;
    final daysToAdd = daysUntil == 0 ? 7 : daysUntil;

    return DateTime(
      today.year,
      today.month,
      today.day,
    ).add(Duration(days: daysToAdd));
  }
}
