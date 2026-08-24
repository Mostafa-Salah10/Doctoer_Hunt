import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/custom_screen_app_bar.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/availbale_time_widget.dart';
import 'package:doctor_hunt/features/appointment/presentation/widgets/custom_calender.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentTimeScreen extends StatelessWidget {
  const AppointmentTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      withHorizontalPadding: false,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                CustomScreensAppBar(title: t.Appointment),
                const VerticalSpace(height: 34),

                const CustomCalendar(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AvailbaleTimeWidget(),
          ),
        ],
      ),
    );
  }
}
