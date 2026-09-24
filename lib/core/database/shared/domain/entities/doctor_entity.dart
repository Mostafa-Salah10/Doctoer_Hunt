import 'dart:io';

class DoctorEntity {
  final String name;
  final String imageUrl;
  final bool isActive;
  final String speciality;
  final String id;

  File? imageFile;

  DoctorEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isActive,
    required this.speciality,

    this.imageFile,
  });
}
