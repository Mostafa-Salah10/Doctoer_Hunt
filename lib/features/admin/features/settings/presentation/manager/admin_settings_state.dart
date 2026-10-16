part of 'admin_settings_cubit.dart';

class AdminSettingsState {
  final BoxState<AdminModel> getCurrentAdmin;
  final BoxState updateCurrentAdmin;
  final File? profileImage;

  AdminSettingsState({
    required this.getCurrentAdmin,
    required this.updateCurrentAdmin,
    required this.profileImage,
  });

  AdminSettingsState.init()
    : this(
        profileImage: null,
        getCurrentAdmin: BoxState.initial(),
        updateCurrentAdmin: BoxState.initial(),
      );

  AdminSettingsState copyWith({
    File? profileImage,
    BoxState<AdminModel>? getCurrentAdmin,
    BoxState? updateCurrentAdmin,
  }) {
    return AdminSettingsState(
      profileImage: profileImage ?? this.profileImage,
      getCurrentAdmin: getCurrentAdmin ?? this.getCurrentAdmin,
      updateCurrentAdmin: updateCurrentAdmin ?? this.updateCurrentAdmin,
    );
  }
}
