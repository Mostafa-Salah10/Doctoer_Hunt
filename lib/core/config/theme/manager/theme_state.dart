part of 'theme_cubit.dart';

sealed class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});
}

final class ThemeInitial extends ThemeState {
  ThemeInitial({required super.themeMode});

  ThemeInitial.init() : super(themeMode: ThemeMode.system);
}

final class GetAppTheme extends ThemeState {
  GetAppTheme({required super.themeMode});
}

final class ChagneAppTheme extends ThemeState {
  ChagneAppTheme({required super.themeMode});
}
