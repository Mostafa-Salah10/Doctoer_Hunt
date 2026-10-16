part of 'language_cubit.dart';

sealed class LanguageState {
  final AppLocale locale;

  LanguageState({required this.locale});
}

final class LanguageInitial extends LanguageState {
  LanguageInitial({required super.locale});
}

final class GetAppLanguage extends LanguageState {
  GetAppLanguage({required super.locale});
}

final class ChangeAppLanguage extends LanguageState {
  ChangeAppLanguage({required super.locale});
}
