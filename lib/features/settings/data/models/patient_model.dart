import 'dart:io';

class PatientModel {
  final String imageUrl;
  final String email;
  final String phone;
  final String name;
  final File? image;
  final String patientId;

  PatientModel({
    required this.patientId,
    required this.imageUrl,
    required this.email,
    required this.phone,
    this.image,
    required this.name,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json, String patientId) {
    return PatientModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      email: json['email'],
      phone: json['phone'],
      patientId: patientId,
    );
  }
}
