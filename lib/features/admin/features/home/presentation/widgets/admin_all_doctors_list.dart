import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_all_doctors_item.dart';
import 'package:flutter/material.dart';

class AdminAllDoctorsList extends StatelessWidget {
  const AdminAllDoctorsList({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return doctors.isEmpty
        ? Center(
            child: Text(
              "No Doctors Found",
              style: context.textTheme.bodyMedium,
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: doctors.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 30, color: Colors.grey, thickness: 0.2),
            itemBuilder: (context, index) {
              return AdminAllDoctorsItem(doctor: doctors.elementAt(index));
            },
          );
  }
}
