import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/widgets.dart';

enum BookingStatus {
  upcoming,
  completed,
  cancelled;

  static BookingStatus fromString(String status) {
    return BookingStatus.values.firstWhere((s) => s.name == status);
  }

  String localizedLabel(BuildContext context) => switch (this) {
    BookingStatus.upcoming => context.t.appointmentStatusUpcoming,
    BookingStatus.completed => context.t.appointmentStatusCompleted,
    BookingStatus.cancelled => context.t.appointmentStatusCancelled,
  };
}
