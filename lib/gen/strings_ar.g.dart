///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get favouriteDoctors => 'أطباء المفضلة';
	@override String get specialistCardiology => 'أخصائي قلب';
	@override String get specialistCancer => 'أخصائي أورام';
	@override String get specialistMedicine => 'أخصائي باطنة';
	@override String get specialistDentist => 'أخصائي أسنان';
	@override String get Appointment => 'حجز موعد';
	@override String get AppointmentFor => 'الحجز لـ';
	@override String get WhoIsThisPatient => 'لمن هذا المريض؟';
	@override String get Next => 'التالي';
	@override String get mySelf => 'أنا';
	@override String get myChild => 'ابني';
	@override String get mySon => 'ابن';
	@override String get createDoctor => 'إنشاء طبيب';
	@override String get doctorName => 'اسم الطبيب';
	@override String get enterDoctorName => 'أدخل اسم الطبيب';
	@override String get speciality => 'التخصص';
	@override String get selectSpeciality => 'اختر التخصص';
	@override String get doctorImage => 'صورة الطبيب';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'favouriteDoctors' => 'أطباء المفضلة',
			'specialistCardiology' => 'أخصائي قلب',
			'specialistCancer' => 'أخصائي أورام',
			'specialistMedicine' => 'أخصائي باطنة',
			'specialistDentist' => 'أخصائي أسنان',
			'Appointment' => 'حجز موعد',
			'AppointmentFor' => 'الحجز لـ',
			'WhoIsThisPatient' => 'لمن هذا المريض؟',
			'Next' => 'التالي',
			'mySelf' => 'أنا',
			'myChild' => 'ابني',
			'mySon' => 'ابن',
			'createDoctor' => 'إنشاء طبيب',
			'doctorName' => 'اسم الطبيب',
			'enterDoctorName' => 'أدخل اسم الطبيب',
			'speciality' => 'التخصص',
			'selectSpeciality' => 'اختر التخصص',
			'doctorImage' => 'صورة الطبيب',
			_ => null,
		};
	}
}
