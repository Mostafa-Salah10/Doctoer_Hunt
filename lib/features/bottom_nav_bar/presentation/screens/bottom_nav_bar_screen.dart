import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
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
    Assets.assetsSvgsHome,
    Assets.assetsSvgsFav,
    Assets.assetsSvgsBook,
    Assets.assetsSvgsMsg,
  ];

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => gi<HomeCubit>()
        ..getPopularDoctors(limit: 3)
        ..getFeatureDoctors(limit: 3),
      
      child: HomeScreen(),
    ),
    FavouriteScreen(),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];
}
