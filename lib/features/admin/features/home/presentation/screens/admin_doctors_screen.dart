import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_all_doctors_list.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_search_bar.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_statistics.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/custom_admin_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AdminAppBar(
          leadingIcon: Icons.menu,
          title: "Doctors",
          leadingAction: () {},

          suffixAction: () {},

          suffixIcon: Icons.notifications_on,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const VerticalSpace(height: 35),
            const AdminSearchBar(),
            const VerticalSpace(height: 20),
            const AdminStatistics(),
            const VerticalSpace(height: 20),

            Expanded(child: const AdminAllDoctorsList()),
          ],
        ),
      ),
    );
  }
}
