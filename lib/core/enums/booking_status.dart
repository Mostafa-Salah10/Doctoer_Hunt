enum BookingStatus {
  upcoming,
  completed,
  cancelled;

  static BookingStatus fromString(String status) {
    return BookingStatus.values.firstWhere((s) => s.name == status);
  }
}
