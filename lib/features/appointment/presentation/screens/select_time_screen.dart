import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/doctor_details_horizontal_card.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/custom_done_dialog.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/select_day_data_with_title.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/select_day_list.dart';
import 'package:flutter/material.dart';

class SelectTimeScreen extends StatelessWidget {
  const SelectTimeScreen({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            CustomScreensAppBar(title: "Select Time"),
            const VerticalSpace(height: 34),
            DoctorDetailsHorizontalCard(
              doctor: doctor,
              withBookingButton: false,
            ),

            const VerticalSpace(height: 20),

            const SelectDayList(),
            const VerticalSpace(height: 20),

            const SelectDayDataWithTitle(),

            const VerticalSpace(height: 20),

            AppButton(
              text: "Confirm",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const CustomDoneDialog(),
                );
              },
            ),

            const VerticalSpace(height: 40),
          ],
        ),
      ),
    );
  }
}
