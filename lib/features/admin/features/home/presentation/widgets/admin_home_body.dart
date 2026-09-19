import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_all_doctors_list.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_search_bar.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/admin_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const VerticalSpace(height: 35),
          const AdminSearchBar(),
          const VerticalSpace(height: 20),
          BlocBuilder<AdminHomeCubit, AdminHomeState>(
            buildWhen: (previous, current) =>
                previous.doctorStatistics != current.doctorStatistics,
            builder: (context, state) {
              return AdminStatistics(
                docotorStatistics: state.doctorStatistics,
                isLoading: state.doctorStatistics == null,
              );
            },
          ),
          const VerticalSpace(height: 20),

          Expanded(
            child: BlocConsumer<AdminHomeCubit, AdminHomeState>(
              buildWhen: (previous, current) =>
                  previous.getAllDoctors != current.getAllDoctors,
              listenWhen: (previous, current) =>
                  previous.deleteDoctor != current.deleteDoctor,

              listener: (context, state) {
                if (state.deleteDoctor.isError) {
                  toastAlert(
                    msg: state.deleteDoctor.error!,
                    color: AppColors.errorColor,
                  );
                } else if (state.deleteDoctor.isSuccess) {
                  toastAlert(
                    msg: "Doctor Deleted Successfully",
                    color: AppColors.primaryColor,
                  );
                }
              },
              builder: (context, state) {
                return state.getAllDoctors.isLoading ||
                        state.getAllDoctors.isInitial
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AdminAllDoctorsList(doctors: state.getAllDoctors.data!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
