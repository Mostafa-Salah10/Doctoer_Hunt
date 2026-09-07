import 'package:doctor_hunt/features/admin/features/home/data/models/admin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_all_doctors_item.dart';
import 'package:flutter/material.dart';

class AdminAllDoctorsList extends StatelessWidget {
  const AdminAllDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: AdminDoctorModel.dummyDoctors.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 30, color: Colors.grey, thickness: 0.2),
      itemBuilder: (context, index) {
        final doctor = AdminDoctorModel.dummyDoctors[index];

        return AdminAllDoctorsItem(doctor: doctor);
      },
    );
  }
}
