part of 'settings_cubit.dart';

class SettingsState {
  final BoxState<PatientModel> getCurrentPatient;
  final BoxState updateCurrentPatient;
  final File? profileImage;

  SettingsState({
    required this.getCurrentPatient,
    required this.updateCurrentPatient,
    required this.profileImage,
  });

  SettingsState.init()
    : this(
        profileImage: null,
        getCurrentPatient: BoxState.initial(),
        updateCurrentPatient: BoxState.initial(),
      );

  SettingsState copyWith({
    File? profileImage,
    BoxState<PatientModel>? getCurrentPatient,
    BoxState? updateCurrentPatient,
  }) {
    return SettingsState(
      profileImage: profileImage ?? this.profileImage,
      getCurrentPatient: getCurrentPatient ?? this.getCurrentPatient,
      updateCurrentPatient: updateCurrentPatient ?? this.updateCurrentPatient,
    );
  }
}
