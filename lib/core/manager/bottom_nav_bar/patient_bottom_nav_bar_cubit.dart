import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit()
    : super(BottomNavBarState(bottomNavBarIndex: 0));

  void updateBottomNavBarIndex(int index) {
    emit(BottomNavBarState(bottomNavBarIndex: index));
  }
}
