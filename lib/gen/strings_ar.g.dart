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
	@override String get chooseYourRole => 'اختر نوع الحساب';
	@override String get roleDescription => 'يحدد نوع الحساب التجربة والميزات المتاحة لك.';
	@override String get patientRole => 'مريض';
	@override String get administrator => 'المسؤول';
	@override String get patientRoleDescription => 'احجز المواعيد وابحث عن الأطباء لرعايتك الصحية.';
	@override String get administratorRoleDescription => 'إدارة الأطباء ومواعيد عملهم.';
	@override String get findTrustedDoctors => 'اعثر على أطباء موثوقين';
	@override String get chooseBestDoctors => 'اختر أفضل الأطباء';
	@override String get easyAppointments => 'مواعيد بسهولة';
	@override String get onboardingDescription => 'على عكس الاعتقاد الشائع، لا يُعد نص لوريم إيبسوم عشوائيًا، بل تعود جذوره إلى الأدب اللاتيني الكلاسيكي قبل نحو ألفي عام.';
	@override String get getStarted => 'ابدأ الآن';
	@override String get skip => 'تخطي';
	@override String get welcomeBack => 'مرحبًا بعودتك';
	@override String get joinUsToStartSearching => 'انضم إلينا وابدأ البحث';
	@override String get authDescription => 'ابحث عن الأطباء واحجز المواعيد واعثر على الرعاية التي تحتاج إليها.';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get name => 'الاسم';
	@override String get signIn => 'تسجيل الدخول';
	@override String get signingIn => 'جارٍ تسجيل الدخول...';
	@override String get signUp => 'إنشاء حساب';
	@override String get signingUp => 'جارٍ إنشاء الحساب...';
	@override String get forgotPassword => 'نسيت كلمة المرور';
	@override String get forgotPasswordQuestion => 'هل نسيت كلمة المرور؟';
	@override String get dontHaveAccountJoinUs => 'ليس لديك حساب؟ انضم إلينا';
	@override String get haveAccountLogIn => 'لديك حساب؟ سجّل الدخول';
	@override String get enterEmailVerificationDescription => 'أدخل بريدك الإلكتروني للتحقق. سنرسل رمزًا من ٤ أرقام إلى بريدك.';
	@override String get enter4DigitsCode => 'أدخل الرمز المكوّن من ٤ أرقام';
	@override String get enter4DigitsCodeDescription => 'أدخل الرمز المكوّن من ٤ أرقام الذي وصلك عبر البريد الإلكتروني.';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get resetPasswordDescription => 'أنشئ كلمة مرور جديدة لحسابك لتتمكن من تسجيل الدخول واستخدام جميع الميزات.';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get reEnterPassword => 'أعد إدخال كلمة المرور';
	@override String get updatePassword => 'تحديث كلمة المرور';
	@override String get checkYourEmail => 'تحقق من بريدك الإلكتروني';
	@override String get continueAction => 'متابعة';
	@override String get sending => 'جارٍ الإرسال...';
	@override String get completeProfile => 'إكمال الملف الشخصي';
	@override String get contactNumber => 'رقم التواصل';
	@override String get phoneNumberExample => 'مثال: 01006828614';
	@override String get save => 'حفظ';
	@override String get saveChanges => 'حفظ التغييرات';
	@override String get update => 'تحديث';
	@override String get create => 'إنشاء';
	@override String get loading => 'جارٍ التحميل...';
	@override String get field => 'الحقل';
	@override String fieldRequired({required Object fieldName}) => 'حقل ${fieldName} مطلوب';
	@override String fieldMinLength({required Object fieldName, required Object length}) => 'يجب ألا يقل طول ${fieldName} عن ${length} أحرف';
	@override String get emailRequired => 'البريد الإلكتروني مطلوب';
	@override String get validEmailRequired => 'أدخل عنوان بريد إلكتروني صالحًا';
	@override String get passwordRequired => 'كلمة المرور مطلوبة';
	@override String passwordMinLength({required Object length}) => 'يجب ألا تقل كلمة المرور عن ${length} أحرف';
	@override String get passwordUppercaseRequired => 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
	@override String get passwordLowercaseRequired => 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
	@override String get passwordNumberRequired => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
	@override String get confirmPasswordRequired => 'تأكيد كلمة المرور مطلوب';
	@override String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';
	@override String get phoneRequired => 'رقم الهاتف مطلوب';
	@override String get validPhoneRequired => 'أدخل رقم هاتف صالحًا';
	@override String get termsAgreementRequired => 'يجب الموافقة على الشروط';
	@override String get otpCodeRequired => 'أدخل رمز التحقق';
	@override String otpMustHaveDigits({required Object digits}) => 'يجب أن يتكوّن رمز التحقق من ${digits} أرقام';
	@override String get termsAgreement => 'أوافق على شروط الخدمة وسياسة الخصوصية';
	@override String get findYourDoctor => 'اعثر على طبيبك';
	@override String get search => 'بحث...';
	@override String get searchDoctors => 'ابحث عن الأطباء';
	@override String get seeAll => 'عرض الكل >';
	@override String get popularDoctor => 'طبيب شائع';
	@override String get featuredDoctor => 'طبيب مميز';
	@override String get popularDoctors => 'الأطباء الشائعون';
	@override String get featuredDoctors => 'الأطباء المميزون';
	@override String get dentist => 'طبيب أسنان';
	@override String get doctorDetails => 'تفاصيل الطبيب';
	@override String get pageNotFound => 'الصفحة غير موجودة';
	@override String get errorDescription => 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.';
	@override String get somethingWentWrong => 'حدث خطأ ما';
	@override String get retry => 'إعادة المحاولة';
	@override String get settings => 'الإعدادات';
	@override String get profile => 'الملف الشخصي';
	@override String get privacyPolicy => 'سياسة الخصوصية';
	@override String get accountSettings => 'إعدادات الحساب';
	@override String get moreOptions => 'خيارات أخرى';
	@override String get changePassword => 'تغيير كلمة المرور';
	@override String get notifications => 'الإشعارات';
	@override String get patientUser => 'مستخدم';
	@override String get privacyPolicyHeading => 'سياسة خصوصية تطبيق دكتور هانت';
	@override String get privacyPolicyParagraphOne => 'تتوفر صيغ عديدة لفقرات لوريم إيبسوم، لكن معظمها خضع لتعديلات أو أضيفت إليه عبارات. ومن المعروف أن القارئ قد يتشتت عند قراءة محتوى الصفحة بسبب طريقة تنسيقها.';
	@override String get privacyPolicyParagraphTwo => 'ومن المعروف أن القارئ قد يتشتت عند قراءة المحتوى بسبب طريقة تنسيق الصفحة. ويُستخدم نص لوريم إيبسوم لأن توزيع حروفه يبدو طبيعيًا.';
	@override String get logout => 'تسجيل الخروج';
	@override String get logoutConfirmation => 'هل أنت متأكد من رغبتك في تسجيل الخروج؟';
	@override String get cancel => 'إلغاء';
	@override String get ok => 'موافق';
	@override String get addImage => 'إضافة صورة';
	@override String get chooseProfileImage => 'اختر صورة الملف الشخصي';
	@override String get appointmentDetails => 'تفاصيل الموعد';
	@override String get appointmentDate => 'تاريخ الموعد';
	@override String get appointmentTime => 'وقت الموعد';
	@override String get consultationFee => 'رسوم الاستشارة';
	@override String get clinicLocation => 'موقع العيادة';
	@override String get date => 'التاريخ';
	@override String get time => 'الوقت';
	@override String get fee => 'الرسوم';
	@override String get rating => 'التقييم';
	@override String get appointmentStatusUpcoming => 'قادم';
	@override String get appointmentStatusCancelled => 'ملغي';
	@override String get appointmentStatusCompleted => 'مكتمل';
	@override String get viewDetails => 'عرض التفاصيل';
	@override String get cancelAppointment => 'إلغاء الموعد';
	@override String get rateDoctor => 'قيّم الطبيب';
	@override String get markAsCompleted => 'وضع علامة كمكتمل';
	@override String get noAppointments => 'لا توجد مواعيد';
	@override String get bookingCancelledSuccessfully => 'تم إلغاء الحجز بنجاح';
	@override String get appointmentMarkedSuccessfully => 'تم تحديث حالة الموعد بنجاح';
	@override String get ratedSuccessfully => 'تم التقييم بنجاح';
	@override String get tapToRateYourVisit => 'اضغط لتقييم زيارتك';
	@override String get noDoctorsFound => 'لم يتم العثور على أطباء';
	@override String get active => 'نشط';
	@override String get notActive => 'غير نشط';
	@override String get manageDoctorQuestion => 'إدارة الطبيب؟';
	@override String get manageDoctorDescription => 'حدّث معلومات الطبيب أو أزله من حسابك';
	@override String get delete => 'حذف';
	@override String get addDoctor => 'إضافة طبيب';
	@override String get uploadDoctorImage => 'تحميل صورة الطبيب';
	@override String get tapToPickImage => 'اضغط لاختيار صورة';
	@override String get doctorAddedSuccessfully => 'تمت إضافة الطبيب بنجاح';
	@override String get doctorUpdatedSuccessfully => 'تم تحديث الطبيب بنجاح';
	@override String get doctorAvailability => 'مواعيد توفر الطبيب';
	@override String get workingDays => 'أيام العمل';
	@override String get workingHours => 'ساعات العمل';
	@override String daysEnabled({required Object count}) => 'تم تفعيل ${count} أيام';
	@override String get oneDayEnabled => 'تم تفعيل يوم واحد';
	@override String get noDaysAvailable => 'لا توجد أيام متاحة';
	@override String get startTime => 'وقت البدء';
	@override String get endTime => 'وقت الانتهاء';
	@override String get slotDuration => 'مدة الفترة';
	@override String get slotDurationExample => 'مثال: 90';
	@override String get minutes => 'دقائق';
	@override String get slotsAddedSuccessfully => 'تمت إضافة الفترات بنجاح';
	@override String get workingDaysUpdatedSuccessfully => 'تم تحديث أيام العمل بنجاح';
	@override String specialtyClinic({required Object specialty}) => 'عيادة ${specialty}';
	@override String get selectTime => 'اختر الوقت';
	@override String get availableTime => 'الأوقات المتاحة';
	@override String get confirm => 'تأكيد';
	@override String afternoonSlots({required Object count}) => 'الفترة المسائية (عدد الفترات: ${count})';
	@override String eveningSlots({required Object count}) => 'فترة المساء (عدد الفترات: ${count})';
	@override String get thankYou => 'شكرًا لك!';
	@override String get appointmentSuccessful => 'تم حجز موعدك بنجاح';
	@override String appointmentConfirmation({required Object doctor, required Object date, required Object time}) => 'حجزت موعدًا مع د. ${doctor} بتاريخ ${date}، الساعة ${time}';
	@override String get done => 'تم';
	@override String get patientName => 'اسم المريض';
	@override String get fullName => 'الاسم الكامل';
	@override String get enterYourName => 'أدخل اسمك';
	@override String get enterYourFullName => 'أدخل اسمك الكامل';
	@override String get enterYourEmailAddress => 'أدخل عنوان بريدك الإلكتروني';
	@override String get editProfile => 'تعديل الملف الشخصي';
	@override String get updateDoctor => 'تحديث الطبيب';
	@override String get doctors => 'الأطباء';
	@override String get appointments => 'المواعيد';
	@override String get totalDoctors => 'إجمالي الأطباء';
	@override String get doctorDeletedSuccessfully => 'تم حذف الطبيب بنجاح';
	@override String get clinic => 'عيادة';
	@override String get dentistry => 'طب الأسنان';
	@override String get cardiology => 'طب القلب';
	@override String get ophthalmology => 'طب العيون';
	@override String get internalMedicine => 'الطب الباطني';
	@override String todayDate({required Object date}) => 'اليوم، ${date}';
	@override String get bookNow => 'احجز الآن';
	@override String doctorHourlyRate({required Object cost}) => '${cost} / ساعة';
	@override String greeting({required Object name}) => 'مرحبًا، ${name}';
	@override String get noSlotsAvailable => 'لا توجد فترات متاحة';
	@override String get oneSlotAvailable => 'فترة واحدة متاحة';
	@override String availableSlots({required Object count}) => 'الفترات المتاحة: ${count}';
	@override String get am => 'ص';
	@override String get pm => 'م';
	@override String selectValue({required Object title}) => 'يرجى اختيار ${title}';
	@override String get oneMinuteDuration => 'دقيقة واحدة';
	@override String minutesDuration({required Object count}) => '${count} دقائق';
	@override String get oneHourDuration => 'ساعة واحدة';
	@override String hoursDuration({required Object count}) => '${count} ساعات';
	@override String oneHourAndMinutesDuration({required Object minutes}) => 'ساعة و${minutes} دقيقة';
	@override String hoursAndOneMinuteDuration({required Object hours}) => '${hours} ساعات ودقيقة واحدة';
	@override String hoursAndMinutesDuration({required Object hours, required Object minutes}) => '${hours} ساعات و${minutes} دقائق';
	@override String get saturday => 'السبت';
	@override String get sunday => 'الأحد';
	@override String get monday => 'الاثنين';
	@override String get tuesday => 'الثلاثاء';
	@override String get wednesday => 'الأربعاء';
	@override String get thursday => 'الخميس';
	@override String get friday => 'الجمعة';
	@override String get doctorServicePatientCare => 'يجب أن تأتي رعاية المرضى في المقام الأول دائمًا.';
	@override String get doctorServicePractice => 'إذا كنت تدير عيادة، فأنت تعرف مدى صعوبة ذلك.';
	@override String get doctorServiceAppointmentReminder => 'لذلك يمكن أن يساعدك نظام التذكير بالمواعيد.';
	@override String get language => 'اللغة';
	@override String get english => 'English';
	@override String get arabic => 'العربية';
	@override String get darkMode => 'الوضع الداكن';
	@override String get darkModeDescription => 'استخدم مظهرًا داكنًا في التطبيق';
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
			'chooseYourRole' => 'اختر نوع الحساب',
			'roleDescription' => 'يحدد نوع الحساب التجربة والميزات المتاحة لك.',
			'patientRole' => 'مريض',
			'administrator' => 'المسؤول',
			'patientRoleDescription' => 'احجز المواعيد وابحث عن الأطباء لرعايتك الصحية.',
			'administratorRoleDescription' => 'إدارة الأطباء ومواعيد عملهم.',
			'findTrustedDoctors' => 'اعثر على أطباء موثوقين',
			'chooseBestDoctors' => 'اختر أفضل الأطباء',
			'easyAppointments' => 'مواعيد بسهولة',
			'onboardingDescription' => 'على عكس الاعتقاد الشائع، لا يُعد نص لوريم إيبسوم عشوائيًا، بل تعود جذوره إلى الأدب اللاتيني الكلاسيكي قبل نحو ألفي عام.',
			'getStarted' => 'ابدأ الآن',
			'skip' => 'تخطي',
			'welcomeBack' => 'مرحبًا بعودتك',
			'joinUsToStartSearching' => 'انضم إلينا وابدأ البحث',
			'authDescription' => 'ابحث عن الأطباء واحجز المواعيد واعثر على الرعاية التي تحتاج إليها.',
			'email' => 'البريد الإلكتروني',
			'password' => 'كلمة المرور',
			'name' => 'الاسم',
			'signIn' => 'تسجيل الدخول',
			'signingIn' => 'جارٍ تسجيل الدخول...',
			'signUp' => 'إنشاء حساب',
			'signingUp' => 'جارٍ إنشاء الحساب...',
			'forgotPassword' => 'نسيت كلمة المرور',
			'forgotPasswordQuestion' => 'هل نسيت كلمة المرور؟',
			'dontHaveAccountJoinUs' => 'ليس لديك حساب؟ انضم إلينا',
			'haveAccountLogIn' => 'لديك حساب؟ سجّل الدخول',
			'enterEmailVerificationDescription' => 'أدخل بريدك الإلكتروني للتحقق. سنرسل رمزًا من ٤ أرقام إلى بريدك.',
			'enter4DigitsCode' => 'أدخل الرمز المكوّن من ٤ أرقام',
			'enter4DigitsCodeDescription' => 'أدخل الرمز المكوّن من ٤ أرقام الذي وصلك عبر البريد الإلكتروني.',
			'resetPassword' => 'إعادة تعيين كلمة المرور',
			'resetPasswordDescription' => 'أنشئ كلمة مرور جديدة لحسابك لتتمكن من تسجيل الدخول واستخدام جميع الميزات.',
			'newPassword' => 'كلمة المرور الجديدة',
			'reEnterPassword' => 'أعد إدخال كلمة المرور',
			'updatePassword' => 'تحديث كلمة المرور',
			'checkYourEmail' => 'تحقق من بريدك الإلكتروني',
			'continueAction' => 'متابعة',
			'sending' => 'جارٍ الإرسال...',
			'completeProfile' => 'إكمال الملف الشخصي',
			'contactNumber' => 'رقم التواصل',
			'phoneNumberExample' => 'مثال: 01006828614',
			'save' => 'حفظ',
			'saveChanges' => 'حفظ التغييرات',
			'update' => 'تحديث',
			'create' => 'إنشاء',
			'loading' => 'جارٍ التحميل...',
			'field' => 'الحقل',
			'fieldRequired' => ({required Object fieldName}) => 'حقل ${fieldName} مطلوب',
			'fieldMinLength' => ({required Object fieldName, required Object length}) => 'يجب ألا يقل طول ${fieldName} عن ${length} أحرف',
			'emailRequired' => 'البريد الإلكتروني مطلوب',
			'validEmailRequired' => 'أدخل عنوان بريد إلكتروني صالحًا',
			'passwordRequired' => 'كلمة المرور مطلوبة',
			'passwordMinLength' => ({required Object length}) => 'يجب ألا تقل كلمة المرور عن ${length} أحرف',
			'passwordUppercaseRequired' => 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل',
			'passwordLowercaseRequired' => 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل',
			'passwordNumberRequired' => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل',
			'confirmPasswordRequired' => 'تأكيد كلمة المرور مطلوب',
			'passwordsDoNotMatch' => 'كلمتا المرور غير متطابقتين',
			'phoneRequired' => 'رقم الهاتف مطلوب',
			'validPhoneRequired' => 'أدخل رقم هاتف صالحًا',
			'termsAgreementRequired' => 'يجب الموافقة على الشروط',
			'otpCodeRequired' => 'أدخل رمز التحقق',
			'otpMustHaveDigits' => ({required Object digits}) => 'يجب أن يتكوّن رمز التحقق من ${digits} أرقام',
			'termsAgreement' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'findYourDoctor' => 'اعثر على طبيبك',
			'search' => 'بحث...',
			'searchDoctors' => 'ابحث عن الأطباء',
			'seeAll' => 'عرض الكل >',
			'popularDoctor' => 'طبيب شائع',
			'featuredDoctor' => 'طبيب مميز',
			'popularDoctors' => 'الأطباء الشائعون',
			'featuredDoctors' => 'الأطباء المميزون',
			'dentist' => 'طبيب أسنان',
			'doctorDetails' => 'تفاصيل الطبيب',
			'pageNotFound' => 'الصفحة غير موجودة',
			'errorDescription' => 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.',
			'somethingWentWrong' => 'حدث خطأ ما',
			'retry' => 'إعادة المحاولة',
			'settings' => 'الإعدادات',
			'profile' => 'الملف الشخصي',
			'privacyPolicy' => 'سياسة الخصوصية',
			'accountSettings' => 'إعدادات الحساب',
			'moreOptions' => 'خيارات أخرى',
			'changePassword' => 'تغيير كلمة المرور',
			'notifications' => 'الإشعارات',
			'patientUser' => 'مستخدم',
			'privacyPolicyHeading' => 'سياسة خصوصية تطبيق دكتور هانت',
			'privacyPolicyParagraphOne' => 'تتوفر صيغ عديدة لفقرات لوريم إيبسوم، لكن معظمها خضع لتعديلات أو أضيفت إليه عبارات. ومن المعروف أن القارئ قد يتشتت عند قراءة محتوى الصفحة بسبب طريقة تنسيقها.',
			'privacyPolicyParagraphTwo' => 'ومن المعروف أن القارئ قد يتشتت عند قراءة المحتوى بسبب طريقة تنسيق الصفحة. ويُستخدم نص لوريم إيبسوم لأن توزيع حروفه يبدو طبيعيًا.',
			'logout' => 'تسجيل الخروج',
			'logoutConfirmation' => 'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
			'cancel' => 'إلغاء',
			'ok' => 'موافق',
			'addImage' => 'إضافة صورة',
			'chooseProfileImage' => 'اختر صورة الملف الشخصي',
			'appointmentDetails' => 'تفاصيل الموعد',
			'appointmentDate' => 'تاريخ الموعد',
			'appointmentTime' => 'وقت الموعد',
			'consultationFee' => 'رسوم الاستشارة',
			'clinicLocation' => 'موقع العيادة',
			'date' => 'التاريخ',
			'time' => 'الوقت',
			'fee' => 'الرسوم',
			'rating' => 'التقييم',
			'appointmentStatusUpcoming' => 'قادم',
			'appointmentStatusCancelled' => 'ملغي',
			'appointmentStatusCompleted' => 'مكتمل',
			'viewDetails' => 'عرض التفاصيل',
			'cancelAppointment' => 'إلغاء الموعد',
			'rateDoctor' => 'قيّم الطبيب',
			'markAsCompleted' => 'وضع علامة كمكتمل',
			'noAppointments' => 'لا توجد مواعيد',
			'bookingCancelledSuccessfully' => 'تم إلغاء الحجز بنجاح',
			'appointmentMarkedSuccessfully' => 'تم تحديث حالة الموعد بنجاح',
			'ratedSuccessfully' => 'تم التقييم بنجاح',
			'tapToRateYourVisit' => 'اضغط لتقييم زيارتك',
			'noDoctorsFound' => 'لم يتم العثور على أطباء',
			'active' => 'نشط',
			'notActive' => 'غير نشط',
			'manageDoctorQuestion' => 'إدارة الطبيب؟',
			'manageDoctorDescription' => 'حدّث معلومات الطبيب أو أزله من حسابك',
			'delete' => 'حذف',
			'addDoctor' => 'إضافة طبيب',
			'uploadDoctorImage' => 'تحميل صورة الطبيب',
			'tapToPickImage' => 'اضغط لاختيار صورة',
			'doctorAddedSuccessfully' => 'تمت إضافة الطبيب بنجاح',
			'doctorUpdatedSuccessfully' => 'تم تحديث الطبيب بنجاح',
			'doctorAvailability' => 'مواعيد توفر الطبيب',
			'workingDays' => 'أيام العمل',
			'workingHours' => 'ساعات العمل',
			'daysEnabled' => ({required Object count}) => 'تم تفعيل ${count} أيام',
			'oneDayEnabled' => 'تم تفعيل يوم واحد',
			'noDaysAvailable' => 'لا توجد أيام متاحة',
			'startTime' => 'وقت البدء',
			'endTime' => 'وقت الانتهاء',
			'slotDuration' => 'مدة الفترة',
			'slotDurationExample' => 'مثال: 90',
			'minutes' => 'دقائق',
			'slotsAddedSuccessfully' => 'تمت إضافة الفترات بنجاح',
			'workingDaysUpdatedSuccessfully' => 'تم تحديث أيام العمل بنجاح',
			'specialtyClinic' => ({required Object specialty}) => 'عيادة ${specialty}',
			'selectTime' => 'اختر الوقت',
			'availableTime' => 'الأوقات المتاحة',
			'confirm' => 'تأكيد',
			'afternoonSlots' => ({required Object count}) => 'الفترة المسائية (عدد الفترات: ${count})',
			'eveningSlots' => ({required Object count}) => 'فترة المساء (عدد الفترات: ${count})',
			'thankYou' => 'شكرًا لك!',
			'appointmentSuccessful' => 'تم حجز موعدك بنجاح',
			'appointmentConfirmation' => ({required Object doctor, required Object date, required Object time}) => 'حجزت موعدًا مع د. ${doctor} بتاريخ ${date}، الساعة ${time}',
			'done' => 'تم',
			'patientName' => 'اسم المريض',
			'fullName' => 'الاسم الكامل',
			'enterYourName' => 'أدخل اسمك',
			'enterYourFullName' => 'أدخل اسمك الكامل',
			'enterYourEmailAddress' => 'أدخل عنوان بريدك الإلكتروني',
			'editProfile' => 'تعديل الملف الشخصي',
			'updateDoctor' => 'تحديث الطبيب',
			'doctors' => 'الأطباء',
			'appointments' => 'المواعيد',
			'totalDoctors' => 'إجمالي الأطباء',
			'doctorDeletedSuccessfully' => 'تم حذف الطبيب بنجاح',
			'clinic' => 'عيادة',
			'dentistry' => 'طب الأسنان',
			'cardiology' => 'طب القلب',
			'ophthalmology' => 'طب العيون',
			'internalMedicine' => 'الطب الباطني',
			'todayDate' => ({required Object date}) => 'اليوم، ${date}',
			'bookNow' => 'احجز الآن',
			'doctorHourlyRate' => ({required Object cost}) => '${cost} / ساعة',
			'greeting' => ({required Object name}) => 'مرحبًا، ${name}',
			'noSlotsAvailable' => 'لا توجد فترات متاحة',
			'oneSlotAvailable' => 'فترة واحدة متاحة',
			'availableSlots' => ({required Object count}) => 'الفترات المتاحة: ${count}',
			'am' => 'ص',
			'pm' => 'م',
			'selectValue' => ({required Object title}) => 'يرجى اختيار ${title}',
			'oneMinuteDuration' => 'دقيقة واحدة',
			'minutesDuration' => ({required Object count}) => '${count} دقائق',
			'oneHourDuration' => 'ساعة واحدة',
			'hoursDuration' => ({required Object count}) => '${count} ساعات',
			'oneHourAndMinutesDuration' => ({required Object minutes}) => 'ساعة و${minutes} دقيقة',
			'hoursAndOneMinuteDuration' => ({required Object hours}) => '${hours} ساعات ودقيقة واحدة',
			'hoursAndMinutesDuration' => ({required Object hours, required Object minutes}) => '${hours} ساعات و${minutes} دقائق',
			'saturday' => 'السبت',
			'sunday' => 'الأحد',
			'monday' => 'الاثنين',
			'tuesday' => 'الثلاثاء',
			'wednesday' => 'الأربعاء',
			'thursday' => 'الخميس',
			'friday' => 'الجمعة',
			'doctorServicePatientCare' => 'يجب أن تأتي رعاية المرضى في المقام الأول دائمًا.',
			'doctorServicePractice' => 'إذا كنت تدير عيادة، فأنت تعرف مدى صعوبة ذلك.',
			'doctorServiceAppointmentReminder' => 'لذلك يمكن أن يساعدك نظام التذكير بالمواعيد.',
			'language' => 'اللغة',
			'english' => 'English',
			'arabic' => 'العربية',
			'darkMode' => 'الوضع الداكن',
			'darkModeDescription' => 'استخدم مظهرًا داكنًا في التطبيق',
			_ => null,
		};
	}
}
