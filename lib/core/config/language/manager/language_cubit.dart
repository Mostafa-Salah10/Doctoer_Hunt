import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
    : super(LanguageInitial(locale: AppLocaleUtils.findDeviceLocale()));

  Future<void> getAppLanguage() async {
    final savedLocale = SharedPreferencesHelper().get(
      key: AppStrings.languageLocale,
    );
    final locale =
        _getSupportedLocale(savedLocale) ?? AppLocaleUtils.findDeviceLocale();
    final appLocale = await LocaleSettings.setLocale(locale);

    emit(GetAppLanguage(locale: appLocale));
  }

  Future<void> changeLanguage({required AppLocale locale}) async {
    if (!AppLocale.values.contains(locale)) {
      throw ArgumentError.value(locale, 'locale', 'Locale is not supported');
    }

    final isSaved = await SharedPreferencesHelper().set(
      key: AppStrings.languageLocale,
      value: _localeIdentifier(locale),
    );
    if (!isSaved) {
      throw StateError('Failed to save the selected language');
    }

    final appLocale = await LocaleSettings.setLocale(locale);

    emit(ChangeAppLanguage(locale: appLocale));
  }

  AppLocale? _getSupportedLocale(Object? savedLocale) {
    if (savedLocale is! String || savedLocale.isEmpty) {
      return null;
    }

    final savedParts = savedLocale
        .split(RegExp('[-_]'))
        .map((part) => part.toLowerCase())
        .toList();
    for (final locale in AppLocale.values) {
      final localeParts = [
        locale.languageCode,
        if (locale.scriptCode != null) locale.scriptCode!,
        if (locale.countryCode != null) locale.countryCode!,
      ];
      if (localeParts.join('-').toLowerCase() == savedParts.join('-')) {
        return locale;
      }
    }

    return null;
  }

  String _localeIdentifier(AppLocale locale) {
    return [
      locale.languageCode,
      if (locale.scriptCode != null) locale.scriptCode!,
      if (locale.countryCode != null) locale.countryCode!,
    ].join('-');
  }
}
