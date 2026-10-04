part of 'select_time_cubit.dart';

class SelectTimeState {
  final int currenDaytIndex;
  final int currenAfterNoontIndex;
  final int currenEveningtIndex;
  const SelectTimeState({
    required this.currenDaytIndex,
    required this.currenAfterNoontIndex,
    required this.currenEveningtIndex,
  });

  SelectTimeState.init()
    : this(
        currenDaytIndex: 0,
        currenAfterNoontIndex: 0,
        currenEveningtIndex: 0,
      );

  SelectTimeState copyWith({
    int? currenDaytIndex,
    int? currenAfterNoontIndex,
    int? currenEveningtIndex,
  }) {
    return SelectTimeState(
      currenDaytIndex: currenDaytIndex ?? this.currenDaytIndex,
      currenAfterNoontIndex:
          currenAfterNoontIndex ?? this.currenAfterNoontIndex,
      currenEveningtIndex: currenEveningtIndex ?? this.currenEveningtIndex,
    );
  }
}
