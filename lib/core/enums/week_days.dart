import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/widgets.dart';

enum Weekday {
  saturday,
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday;

  String localizedName(BuildContext context) => switch (this) {
    Weekday.saturday => context.t.saturday,
    Weekday.sunday => context.t.sunday,
    Weekday.monday => context.t.monday,
    Weekday.tuesday => context.t.tuesday,
    Weekday.wednesday => context.t.wednesday,
    Weekday.thursday => context.t.thursday,
    Weekday.friday => context.t.friday,
  };
}
