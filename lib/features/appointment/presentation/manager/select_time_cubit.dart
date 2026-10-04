import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_time_state.dart';

class SelectTimeCubit extends Cubit<SelectTimeState> {
  SelectTimeCubit() : super(SelectTimeState.init());

  void changeSelectedDay(int index) {
    emit(state.copyWith(currenDaytIndex: index));
  }

  void changeSelectedAfterNoonTime(int index) {
    emit(state.copyWith(currenAfterNoontIndex: index));
  }

  void changeSelectedEveningTime(int index) {
    emit(state.copyWith(currenEveningtIndex: index));
  }
}
