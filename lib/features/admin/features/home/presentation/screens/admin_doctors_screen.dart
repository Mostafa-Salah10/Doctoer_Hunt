import 'package:doctor_hunt/core/widgets/custom_admin_app_bar_screens.dart';
import 'package:doctor_hunt/core/widgets/error_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_floating_action_button.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_home_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AdminFloatingActionButton(),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CustomAdminAppBarScreens(title: "Doctors"),
            ),

            Expanded(
              child: BlocBuilder<AdminHomeCubit, AdminHomeState>(
                buildWhen: (previous, current) =>
                    previous.errorType != current.errorType,
                builder: (context, state) {
                  return state.errorType != null
                      ? MyErrorWidget(
                          onRetry: () {
                            context.read<AdminHomeCubit>().getAllDoctors();
                          },
                        )
                      : AdminHomeBody();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
