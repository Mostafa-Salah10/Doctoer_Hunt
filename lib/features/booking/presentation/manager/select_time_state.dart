part of 'select_time_cubit.dart';

class SelectTimeState {
  final int currenDaytIndex;
  final int currenAfterNoontIndex;
  final int currenEveningtIndex;

  final List<SlotModel> afternoonSlots;
  final List<SlotModel> eveningSlots;

  final BoxState<List<DoctorAvailableDayModel>> availableDaysState;
  const SelectTimeState({
    required this.currenDaytIndex,
    required this.currenAfterNoontIndex,
    required this.currenEveningtIndex,
    required this.availableDaysState,

    required this.afternoonSlots,
    required this.eveningSlots,
  });

  SelectTimeState.init()
    : this(
        currenDaytIndex: 0,
        currenAfterNoontIndex: 0,
        currenEveningtIndex: 0,
        availableDaysState: BoxState.initial(),
        afternoonSlots: [],
        eveningSlots: [],
      );

  SelectTimeState copyWith({
    int? currenDaytIndex,
    int? currenAfterNoontIndex,
    int? currenEveningtIndex,
    BoxState<List<DoctorAvailableDayModel>>? availableDaysState,
    List<SlotModel>? afternoonSlots,
    List<SlotModel>? eveningSlots,
  }) {
    return SelectTimeState(
      afternoonSlots: afternoonSlots ?? this.afternoonSlots,
      eveningSlots: eveningSlots ?? this.eveningSlots,
      availableDaysState: availableDaysState ?? this.availableDaysState,
      currenDaytIndex: currenDaytIndex ?? this.currenDaytIndex,
      currenAfterNoontIndex:
          currenAfterNoontIndex ?? this.currenAfterNoontIndex,
      currenEveningtIndex: currenEveningtIndex ?? this.currenEveningtIndex,
    );
  }
}
