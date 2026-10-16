import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/manager/doctor_availability_cubit.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_data.dart';
import 'package:doctor_hunt/features/admin/features/availability/presentation/widgets/doctor_availability_top_card.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAvailabilityScreen extends StatelessWidget {
  const DoctorAvailabilityScreen({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      appBar: AppBar(
        title: Text(context.t.doctorAvailability),
        backgroundColor: AppColors.primaryColorLight,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(height: 15),
              DoctorAvailabilityTopCard(doctor: doctor),
              const VerticalSpace(height: 15),

              const DoctorAvailabilityData(),
              const VerticalSpace(height: 15),

              BlocConsumer<DoctorAvailabilityCubit, DoctorAvailabilityState>(
                buildWhen: (previous, current) =>
                    previous.addSlotsAndWorkingDays !=
                        current.addSlotsAndWorkingDays ||
                    previous.updateWorkingDays != current.updateWorkingDays,
                listenWhen: (previous, current) =>
                    previous.addSlotsAndWorkingDays !=
                        current.addSlotsAndWorkingDays ||
                    previous.updateWorkingDays != current.updateWorkingDays,
                listener: (context, state) {
                  if (state.addSlotsAndWorkingDays.isSuccess) {
                    toastAlert(
                      msg: context.t.slotsAddedSuccessfully,
                      color: AppColors.primaryColor,
                    );

                    context.pop();
                    context.pop();
                  } else if (state.updateWorkingDays.isSuccess &&
                      state.workingDays.data!.fristSet == false) {
                    toastAlert(
                      msg: context.t.workingDaysUpdatedSuccessfully,
                      color: AppColors.primaryColor,
                    );
                  } else if (state.addSlotsAndWorkingDays.isError ||
                      state.updateWorkingDays.isError) {
                    toastAlert(
                      msg: context.t.somethingWentWrong,
                      color: AppColors.errorColor,
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading =
                      state.updateWorkingDays.isLoading ||
                      state.addSlotsAndWorkingDays.isLoading;
                  return AppButton(
                    text: isLoading ? context.t.loading : context.t.save,
                    onPressed: () {
                      if (isLoading) return;
                      final cubit = context.read<DoctorAvailabilityCubit>();
                      final data = cubit.state.workingDays.data;

                      if (data != null) {
                        if (data.fristSet) {
                          cubit.addSlotsAndWorkingDays(doctor.id);
                        } else {
                          cubit.updateWorkingDays(doctor.id);
                        }
                      }
                    },
                  );
                },
              ),

              const VerticalSpace(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
