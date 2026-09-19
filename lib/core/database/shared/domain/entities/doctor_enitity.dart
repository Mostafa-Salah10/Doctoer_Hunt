import 'dart:io';

class DoctorEnitity {
  final String name;
  final String imageUrl;
  final bool isActive;
  final String speciality;
  final String id;

  final File? imageFile;

  DoctorEnitity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isActive,
    required this.speciality,

    this.imageFile,
  });
}
