class StringHelper {
  static String formatAvailableSlots(int numberOfSlots) {
    if (numberOfSlots == 0) {
      return 'No slots available';
    }

    return '$numberOfSlots slots available';
  }
}
