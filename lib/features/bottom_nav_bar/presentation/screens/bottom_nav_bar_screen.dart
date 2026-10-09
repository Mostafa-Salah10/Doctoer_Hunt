
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/appointment/presentation/manager/appointment_cubit.dart';
import 'package:doctor_hunt/features/appointment/presentation/screens/patient_appointment_screen.dart';
import 'package:doctor_hunt/core/manager/bottom_nav_bar/patient_bottom_nav_bar_cubit.dart';
import 'package:doctor_hunt/features/favourite/presentation/manager/favourite_cubit.dart';
import 'package:doctor_hunt/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:doctor_hunt/features/settings/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBottomNavBarScreen extends StatelessWidget {
  PatientBottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      buildWhen: (previous, current) =>
          previous.bottomNavBarIndex != current.bottomNavBarIndex,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            onPop: () {
              if (state.bottomNavBarIndex == 0) {
                SystemNavigator.pop();
              } else {
                context
                    .read<BottomNavBarCubit>()
                    .updateBottomNavBarIndex(0);
              }
            },
            currentIndex: state.bottomNavBarIndex,
            onBottomNavBarChanged: (index) {
              context.read<BottomNavBarCubit>().updateBottomNavBarIndex(
                index,
              );
            },
            icons: _icons,
          ),

          body: _screens.elementAt(state.bottomNavBarIndex),
        );
      },
    );
  }

  final List<String> _icons = [
    Assets.assetsSvgsHome,
    Assets.assetsSvgsFav,
    Assets.assetsSvgsBook,
    Assets.assetsSvgsSettingsOutline,
  ];

  final List<Widget> _screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => gi<HomeCubit>()),
        BlocProvider(
          create: (context) => gi<FavouriteCubit>()..getFavouritesIds(),
        ),
      ],
      child: HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => gi<HomeCubit>()..getFeatureDoctors(limit: 3),
        ),
        BlocProvider(create: (context) => gi<FavouriteCubit>()),
      ],
      child: FavouriteScreen(),
    ),

    BlocProvider(
      create: (context) => gi<AppointmentCubit>()..getPatientAppointments(),
      child: PatientAppointmentScreen(),
    ),

    SettingScreen(),
  ];
}
