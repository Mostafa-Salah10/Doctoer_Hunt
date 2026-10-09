import 'package:doctor_hunt/core/manager/bottom_nav_bar/patient_bottom_nav_bar_cubit.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/screens/admin_doctors_screen.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/screens/admin_settings_screen.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/screens/admin_appointment_screen.dart';

import 'package:doctor_hunt/features/home/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBottomNavBar extends StatelessWidget {
  AdminBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            onPop: () {
              if (state.bottomNavBarIndex == 0) {
                SystemNavigator.pop();
              } else {
                context.read<BottomNavBarCubit>().updateBottomNavBarIndex(0);
              }
            },
            titles: titles,
            currentIndex: state.bottomNavBarIndex,
            onBottomNavBarChanged: (index) {
              context.read<BottomNavBarCubit>().updateBottomNavBarIndex(index);
            },
            icons: _icons,
          ),

          body: _screens.elementAt(state.bottomNavBarIndex),
        );
      },
    );
  }

  final List<String> _icons = [
    Assets.assetsSvgsAdminDoctor,
    Assets.assetsSvgsBook,
    Assets.assetsSvgsSettings,
  ];

  final List<String> titles = ["Doctors", "Appointments", "Settings"];

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => gi.get<AdminHomeCubit>()..getAllDoctors(),
      child: AdminDoctorsScreen(),
    ),
    BlocProvider(
      create: (context) => gi<AppointmentCubit>()..getAllAppointment(),
      child: AdminAppointmentScreen(),
    ),

    AdminSettingsScreen(),
  ];
}
