import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    final now = DateTime.now();

    final isToday =
        parsedDate.year == now.year &&
        parsedDate.month == now.month &&
        parsedDate.day == now.day;

    return isToday
        ? 'Today, ${DateFormat('d MMM').format(parsedDate)}'
        : DateFormat('EEE, d MMM').format(parsedDate);
  }
}
