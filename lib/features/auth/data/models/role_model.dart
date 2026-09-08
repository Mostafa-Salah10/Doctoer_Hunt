import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/utils/assets.dart';

class RoleModel {
  final Role role;
  final String icon;
  final String description;

  RoleModel({
    required this.role,
    required this.icon,
    required this.description,
  });

  static List<RoleModel> get roles => [
    RoleModel(
      role: Role.patient,
      icon: Assets.assetsSvgsPatientRole,
      description:
          'Find doctors, book\n appointments,\n and manage your medical\n records.',
    ),
    RoleModel(
      role: Role.doctor,
      icon: Assets.assetsSvgsAdminRole,
      description:
          'Find doctors, book appointments,\nand manage your medical records.',
    ),
  ];
}
