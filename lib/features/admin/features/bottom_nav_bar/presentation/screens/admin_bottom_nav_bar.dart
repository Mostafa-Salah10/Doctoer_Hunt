import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/screens/admin_doctors_screen.dart';

import 'package:doctor_hunt/features/home/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBottomNavBar extends StatelessWidget {
  AdminBottomNavBar({super.key});

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            titles: titles,
            currentIndex: _currentIndex.value,
            onBottomNavBarChanged: (index) {
              _currentIndex.value = index;
            },
            icons: _icons,
          ),

          body: _screens.elementAt(_currentIndex.value),
        );
      },
    );
  }

  final List<String> _icons = [
    Assets.assetsSvgsTeam,
    Assets.assetsSvgsSettings,
  ];

  final List<String> titles = ["Doctors", "Settings"];

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => gi.get<AdminHomeCubit>()..getAllDoctors(),
      child: AdminDoctorsScreen(),
    ),
    Container(color: AppColors.redLinearOne),
  ];
}
