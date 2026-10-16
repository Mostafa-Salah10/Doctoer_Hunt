import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/widgets.dart';

class StringHelper {
  static String formatAvailableSlots(BuildContext context, int numberOfSlots) {
    if (numberOfSlots == 0) {
      return context.t.noSlotsAvailable;
    }

    return numberOfSlots == 1
        ? context.t.oneSlotAvailable
        : context.t.availableSlots(count: numberOfSlots);
  }
}
