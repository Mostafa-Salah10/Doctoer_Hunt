import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

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
    HomeScreen(),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];
}
