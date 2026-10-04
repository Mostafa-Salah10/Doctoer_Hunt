import 'package:doctor_hunt/features/booking/data/models/slot_model.dart';

class DoctorAvailableDayModel {
  final String availableDay;
  final int numberOfAvailableSlots;
  final List<SlotModel> afternoonSlots;
  final List<SlotModel> eveningSlots;

  DoctorAvailableDayModel({
    required this.availableDay,
    required this.numberOfAvailableSlots,
    required this.afternoonSlots,
    required this.eveningSlots,
  });
}
