import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/doctor_details_horizontal_card.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/booking/presentation/manager/select_time_cubit.dart';
import 'package:doctor_hunt/features/booking/presentation/widgets/custom_done_dialog.dart';
import 'package:doctor_hunt/features/booking/presentation/widgets/select_day_data_with_title.dart';
import 'package:doctor_hunt/features/booking/presentation/widgets/select_day_list.dart';
import 'package:doctor_hunt/features/settings/presentation/manager/settings_cubit.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTimeScreenBody extends StatelessWidget {
  const SelectTimeScreenBody({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScreensAppBar(title: context.t.selectTime),
        const VerticalSpace(height: 34),
        DoctorDetailsHorizontalCard(doctor: doctor, withBookingButton: false),
        Expanded(
          child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
            buildWhen: (previous, current) =>
                previous.availableDaysState != current.availableDaysState,
            builder: (context, state) {
              if (state.availableDaysState.isInitial ||
                  state.availableDaysState.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }

              if (state.availableDaysState.isError) {
                return Center(child: Text(context.t.somethingWentWrong));
              }

              if (state.availableDaysState.data!.isEmpty) {
                return Center(child: Image.asset(Assets.assetsImagesNoSlots));
              }

              return Column(
                children: [
                  const VerticalSpace(height: 20),
                  SelectDayList(doctorId: doctor.id),
                  const VerticalSpace(height: 20),
                  const SelectDayDataWithTitle(),
                  const VerticalSpace(height: 20),
                  BlocConsumer<SelectTimeCubit, SelectTimeState>(
                    buildWhen: (previous, current) =>
                        previous.bookWithDoctor != current.bookWithDoctor,
                    listenWhen: (previous, current) =>
                        previous.bookWithDoctor != current.bookWithDoctor,
                    listener: (context, state) {
                      if (state.bookWithDoctor.isError) {
                        toastAlert(
                          msg: state.bookWithDoctor.error!,
                          color: AppColors.errorColor,
                        );
                      } else if (state.bookWithDoctor.isSuccess) {
                        // toastAlert(
                        //   msg: "Slot Booking Successfully",
                        //   color: AppColors.primaryColor,
                        // );

                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => CustomDoneDialog(),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        text: state.bookWithDoctor.isLoading
                            ? context.t.loading
                            : context.t.confirm,
                        onPressed: () async {
                          final book = context.read<SelectTimeCubit>();
                          await book.bookWithDoctor(
                            patient: context
                                .read<SettingsCubit>()
                                .state
                                .getCurrentPatient
                                .data!,
                            doctor: doctor,
                          );
                        },
                      );
                    },
                  ),
                  const VerticalSpace(height: 40),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
