import 'dart:io';

class AdminModel {
  final String name;
  final String adminId;
  final String imageUrl;
  final File? image;
  final String email;

  AdminModel({
    required this.name,
    required this.adminId,
    required this.imageUrl,
    this.image,
    required this.email,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json, String adminId) {
    return AdminModel(
      name: json['name'],
      adminId: adminId,
      imageUrl: json['imageUrl'],

      email: json['email'],
    );
  }
}
