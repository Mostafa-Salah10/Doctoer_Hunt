import 'package:doctor_hunt/core/enums/booking_status.dart';

class AppointmentModel {
  final String date;
  final String doctorId;
  final String patientId;
  final String slot;
  final BookingStatus status;
  final String bookingId;

  final String doctorName;
  final String doctorImage;
  final String patientName;
  final String paientImage;

  AppointmentModel({
    required this.date,
    required this.doctorId,
    required this.patientId,
    required this.slot,
    required this.status,
    required this.bookingId,
    required this.doctorName,
    required this.doctorImage,
    required this.patientName,
    required this.paientImage,
  });

  factory AppointmentModel.fromJson(
    Map<String, dynamic> json, {
    required String bookingId,
  }) {
    return AppointmentModel(
      date: json['date'],
      doctorId: json['doctorId'],
      patientId: json['patientId'],
      slot: json['slot'],
      status: BookingStatus.fromString(json['status']),
      bookingId: bookingId,
      doctorImage: json['doctorImage'],
      paientImage: json['patientImage'],
      doctorName: json['doctorName'],
      patientName: json["patientName"],
    );
  }
}
