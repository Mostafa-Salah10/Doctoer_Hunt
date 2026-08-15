import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial.init()) {
    getAppTheme();
  }

  void getAppTheme() {
    final appTheme = SharedPreferencesHelper().get(key: AppStrings.themeMode);
    emit(
      GetAppTheme(
        themeMode: ThemeMode.values[appTheme ?? ThemeMode.light.index],
      ),
    );
  }

  void changeTheme({required ThemeMode themeMode}) async {
    await SharedPreferencesHelper().set(
      key: AppStrings.themeMode,
      value: themeMode.index,
    );

    emit(ChagneAppTheme(themeMode: themeMode));
  }
}
