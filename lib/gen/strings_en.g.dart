///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Favourite Doctors'
	String get favouriteDoctors => 'Favourite Doctors';

	/// en: 'Specialist Cardiology'
	String get specialistCardiology => 'Specialist Cardiology';

	/// en: 'Specialist Cancer'
	String get specialistCancer => 'Specialist Cancer';

	/// en: 'Specialist Medicine'
	String get specialistMedicine => 'Specialist Medicine';

	/// en: 'Specialist Dentist'
	String get specialistDentist => 'Specialist Dentist';

	/// en: 'Appointment'
	String get Appointment => 'Appointment';

	/// en: 'Appointment For'
	String get AppointmentFor => 'Appointment For';

	/// en: 'Who is this patient?'
	String get WhoIsThisPatient => 'Who is this patient?';

	/// en: 'Next'
	String get Next => 'Next';

	/// en: 'My self'
	String get mySelf => 'My self';

	/// en: 'My child'
	String get myChild => 'My child';

	/// en: 'My son'
	String get mySon => 'My son';

	/// en: 'Create Doctor'
	String get createDoctor => 'Create Doctor';

	/// en: 'Doctor Name'
	String get doctorName => 'Doctor Name';

	/// en: 'Enter Doctor Name'
	String get enterDoctorName => 'Enter Doctor Name';

	/// en: 'Speciality'
	String get speciality => 'Speciality';

	/// en: 'Select Speciality'
	String get selectSpeciality => 'Select Speciality';

	/// en: 'Doctor Image'
	String get doctorImage => 'Doctor Image';

	/// en: 'Choose your role'
	String get chooseYourRole => 'Choose your role';

	/// en: 'The selected role determines the experience and available features.'
	String get roleDescription => 'The selected role determines the experience and available features.';

	/// en: 'Patient'
	String get patientRole => 'Patient';

	/// en: 'Administrator'
	String get administrator => 'Administrator';

	/// en: 'Book appointments and find doctors for your care.'
	String get patientRoleDescription => 'Book appointments and find doctors for your care.';

	/// en: 'Manage doctors and their availability.'
	String get administratorRoleDescription => 'Manage doctors and their availability.';

	/// en: 'Find Trusted Doctors'
	String get findTrustedDoctors => 'Find Trusted Doctors';

	/// en: 'Choose Best Doctors'
	String get chooseBestDoctors => 'Choose Best Doctors';

	/// en: 'Easy Appointments'
	String get easyAppointments => 'Easy Appointments';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 2000 years ago.'
	String get onboardingDescription => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 2000 years ago.';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Welcome back'
	String get welcomeBack => 'Welcome back';

	/// en: 'Join us to start searching'
	String get joinUsToStartSearching => 'Join us to start searching';

	/// en: 'Search for doctors, book appointments, and find the care you need.'
	String get authDescription => 'Search for doctors, book appointments, and find the care you need.';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Sign in'
	String get signIn => 'Sign in';

	/// en: 'Signing in...'
	String get signingIn => 'Signing in...';

	/// en: 'Sign up'
	String get signUp => 'Sign up';

	/// en: 'Signing up...'
	String get signingUp => 'Signing up...';

	/// en: 'Forgot password'
	String get forgotPassword => 'Forgot password';

	/// en: 'Forgot password?'
	String get forgotPasswordQuestion => 'Forgot password?';

	/// en: 'Don’t have an account? Join us'
	String get dontHaveAccountJoinUs => 'Don’t have an account? Join us';

	/// en: 'Have an account? Log in'
	String get haveAccountLogIn => 'Have an account? Log in';

	/// en: 'Enter your email for verification. We will send a 4-digit code to your email.'
	String get enterEmailVerificationDescription => 'Enter your email for verification. We will send a 4-digit code to your email.';

	/// en: 'Enter 4-digit code'
	String get enter4DigitsCode => 'Enter 4-digit code';

	/// en: 'Enter the 4-digit code you received by email.'
	String get enter4DigitsCodeDescription => 'Enter the 4-digit code you received by email.';

	/// en: 'Reset Password'
	String get resetPassword => 'Reset Password';

	/// en: 'Set a new password for your account so you can log in and access all the features.'
	String get resetPasswordDescription => 'Set a new password for your account so you can log in and access all the features.';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Re-enter Password'
	String get reEnterPassword => 'Re-enter Password';

	/// en: 'Update Password'
	String get updatePassword => 'Update Password';

	/// en: 'Check your email'
	String get checkYourEmail => 'Check your email';

	/// en: 'Continue'
	String get continueAction => 'Continue';

	/// en: 'Sending...'
	String get sending => 'Sending...';

	/// en: 'Complete Profile'
	String get completeProfile => 'Complete Profile';

	/// en: 'Contact Number'
	String get contactNumber => 'Contact Number';

	/// en: 'e.g. 01006828614'
	String get phoneNumberExample => 'e.g. 01006828614';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Save Changes'
	String get saveChanges => 'Save Changes';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Field'
	String get field => 'Field';

	/// en: '$fieldName is required'
	String fieldRequired({required Object fieldName}) => '${fieldName} is required';

	/// en: '$fieldName must be at least $length characters'
	String fieldMinLength({required Object fieldName, required Object length}) => '${fieldName} must be at least ${length} characters';

	/// en: 'Email is required'
	String get emailRequired => 'Email is required';

	/// en: 'Enter a valid email address'
	String get validEmailRequired => 'Enter a valid email address';

	/// en: 'Password is required'
	String get passwordRequired => 'Password is required';

	/// en: 'Password must be at least $length characters'
	String passwordMinLength({required Object length}) => 'Password must be at least ${length} characters';

	/// en: 'Password must contain at least one uppercase letter'
	String get passwordUppercaseRequired => 'Password must contain at least one uppercase letter';

	/// en: 'Password must contain at least one lowercase letter'
	String get passwordLowercaseRequired => 'Password must contain at least one lowercase letter';

	/// en: 'Password must contain at least one number'
	String get passwordNumberRequired => 'Password must contain at least one number';

	/// en: 'Confirm password is required'
	String get confirmPasswordRequired => 'Confirm password is required';

	/// en: 'Passwords do not match'
	String get passwordsDoNotMatch => 'Passwords do not match';

	/// en: 'Phone number is required'
	String get phoneRequired => 'Phone number is required';

	/// en: 'Enter a valid phone number'
	String get validPhoneRequired => 'Enter a valid phone number';

	/// en: 'You must agree to the terms'
	String get termsAgreementRequired => 'You must agree to the terms';

	/// en: 'Enter the OTP code'
	String get otpCodeRequired => 'Enter the OTP code';

	/// en: 'OTP must be $digits digits'
	String otpMustHaveDigits({required Object digits}) => 'OTP must be ${digits} digits';

	/// en: 'I agree with the Terms of Service & Privacy Policy'
	String get termsAgreement => 'I agree with the Terms of Service & Privacy Policy';

	/// en: 'Find Your Doctor'
	String get findYourDoctor => 'Find Your Doctor';

	/// en: 'Search...'
	String get search => 'Search...';

	/// en: 'Search doctors'
	String get searchDoctors => 'Search doctors';

	/// en: 'See all >'
	String get seeAll => 'See all >';

	/// en: 'Popular Doctor'
	String get popularDoctor => 'Popular Doctor';

	/// en: 'Feature Doctor'
	String get featuredDoctor => 'Feature Doctor';

	/// en: 'Popular Doctors'
	String get popularDoctors => 'Popular Doctors';

	/// en: 'Feature Doctors'
	String get featuredDoctors => 'Feature Doctors';

	/// en: 'Dentist'
	String get dentist => 'Dentist';

	/// en: 'Doctor Details'
	String get doctorDetails => 'Doctor Details';

	/// en: 'Page Not Found'
	String get pageNotFound => 'Page Not Found';

	/// en: 'Something went wrong. Please try again later.'
	String get errorDescription => 'Something went wrong. Please try again later.';

	/// en: 'Something went wrong'
	String get somethingWentWrong => 'Something went wrong';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Privacy policy'
	String get privacyPolicy => 'Privacy policy';

	/// en: 'Account settings'
	String get accountSettings => 'Account settings';

	/// en: 'More options'
	String get moreOptions => 'More options';

	/// en: 'Change Password'
	String get changePassword => 'Change Password';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Patient User'
	String get patientUser => 'Patient User';

	/// en: 'Doctor Hunt Apps Privacy Policy'
	String get privacyPolicyHeading => 'Doctor Hunt Apps Privacy Policy';

	/// en: 'Many variations of Lorem Ipsum passages are available, but most have been changed in some way by added humor or altered words. It is a long-established fact that readers are distracted by readable content when looking at a page layout.'
	String get privacyPolicyParagraphOne => 'Many variations of Lorem Ipsum passages are available, but most have been changed in some way by added humor or altered words. It is a long-established fact that readers are distracted by readable content when looking at a page layout.';

	/// en: 'It is a long-established fact that readers are distracted by readable content when looking at a page layout. The point of using Lorem Ipsum is that it has a more natural distribution of letters.'
	String get privacyPolicyParagraphTwo => 'It is a long-established fact that readers are distracted by readable content when looking at a page layout. The point of using Lorem Ipsum is that it has a more natural distribution of letters.';

	/// en: 'Log Out'
	String get logout => 'Log Out';

	/// en: 'Are you sure you want to log out?'
	String get logoutConfirmation => 'Are you sure you want to log out?';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Add Image'
	String get addImage => 'Add Image';

	/// en: 'Choose Profile Image'
	String get chooseProfileImage => 'Choose Profile Image';

	/// en: 'Appointment Details'
	String get appointmentDetails => 'Appointment Details';

	/// en: 'Appointment date'
	String get appointmentDate => 'Appointment date';

	/// en: 'Appointment time'
	String get appointmentTime => 'Appointment time';

	/// en: 'Consultation fee'
	String get consultationFee => 'Consultation fee';

	/// en: 'Clinic Location'
	String get clinicLocation => 'Clinic Location';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Time'
	String get time => 'Time';

	/// en: 'Fee'
	String get fee => 'Fee';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Upcoming'
	String get appointmentStatusUpcoming => 'Upcoming';

	/// en: 'Cancelled'
	String get appointmentStatusCancelled => 'Cancelled';

	/// en: 'Completed'
	String get appointmentStatusCompleted => 'Completed';

	/// en: 'View Details'
	String get viewDetails => 'View Details';

	/// en: 'Cancel Appointment'
	String get cancelAppointment => 'Cancel Appointment';

	/// en: 'Rate Doctor'
	String get rateDoctor => 'Rate Doctor';

	/// en: 'Mark as completed'
	String get markAsCompleted => 'Mark as completed';

	/// en: 'No Appointments'
	String get noAppointments => 'No Appointments';

	/// en: 'Booking cancelled successfully'
	String get bookingCancelledSuccessfully => 'Booking cancelled successfully';

	/// en: 'Appointment marked successfully'
	String get appointmentMarkedSuccessfully => 'Appointment marked successfully';

	/// en: 'Rated successfully'
	String get ratedSuccessfully => 'Rated successfully';

	/// en: 'Tap to rate your visit'
	String get tapToRateYourVisit => 'Tap to rate your visit';

	/// en: 'No Doctors Found'
	String get noDoctorsFound => 'No Doctors Found';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Not Active'
	String get notActive => 'Not Active';

	/// en: 'Manage Doctor?'
	String get manageDoctorQuestion => 'Manage Doctor?';

	/// en: 'Update the doctor's information or remove the doctor from your account'
	String get manageDoctorDescription => 'Update the doctor\'s information or remove the doctor from your account';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Add Doctor'
	String get addDoctor => 'Add Doctor';

	/// en: 'Upload Doctor Image'
	String get uploadDoctorImage => 'Upload Doctor Image';

	/// en: 'Tap to pick an image'
	String get tapToPickImage => 'Tap to pick an image';

	/// en: 'Doctor Added Successfully'
	String get doctorAddedSuccessfully => 'Doctor Added Successfully';

	/// en: 'Doctor Updated Successfully'
	String get doctorUpdatedSuccessfully => 'Doctor Updated Successfully';

	/// en: 'Doctor Availability'
	String get doctorAvailability => 'Doctor Availability';

	/// en: 'Working Days'
	String get workingDays => 'Working Days';

	/// en: 'Working Hours'
	String get workingHours => 'Working Hours';

	/// en: '$count days enabled'
	String daysEnabled({required Object count}) => '${count} days enabled';

	/// en: '1 day enabled'
	String get oneDayEnabled => '1 day enabled';

	/// en: 'No days available'
	String get noDaysAvailable => 'No days available';

	/// en: 'Start Time'
	String get startTime => 'Start Time';

	/// en: 'End Time'
	String get endTime => 'End Time';

	/// en: 'Slot Duration'
	String get slotDuration => 'Slot Duration';

	/// en: 'e.g. 90'
	String get slotDurationExample => 'e.g. 90';

	/// en: 'Minutes'
	String get minutes => 'Minutes';

	/// en: 'Slots Added Successfully'
	String get slotsAddedSuccessfully => 'Slots Added Successfully';

	/// en: 'Working Days Updated Successfully'
	String get workingDaysUpdatedSuccessfully => 'Working Days Updated Successfully';

	/// en: '$specialty Clinic'
	String specialtyClinic({required Object specialty}) => '${specialty} Clinic';

	/// en: 'Select Time'
	String get selectTime => 'Select Time';

	/// en: 'Available Time'
	String get availableTime => 'Available Time';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Afternoon ($count slots)'
	String afternoonSlots({required Object count}) => 'Afternoon (${count} slots)';

	/// en: 'Evening ($count slots)'
	String eveningSlots({required Object count}) => 'Evening (${count} slots)';

	/// en: 'Thank You!'
	String get thankYou => 'Thank You!';

	/// en: 'Your appointment was successful'
	String get appointmentSuccessful => 'Your appointment was successful';

	/// en: 'You booked an appointment with Dr. $doctor on $date, at $time'
	String appointmentConfirmation({required Object doctor, required Object date, required Object time}) => 'You booked an appointment with Dr. ${doctor} on ${date}, at ${time}';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Patient Name'
	String get patientName => 'Patient Name';

	/// en: 'Full Name'
	String get fullName => 'Full Name';

	/// en: 'Enter your name'
	String get enterYourName => 'Enter your name';

	/// en: 'Enter your full name'
	String get enterYourFullName => 'Enter your full name';

	/// en: 'Enter your email address'
	String get enterYourEmailAddress => 'Enter your email address';

	/// en: 'Edit Profile'
	String get editProfile => 'Edit Profile';

	/// en: 'Update Doctor'
	String get updateDoctor => 'Update Doctor';

	/// en: 'Doctors'
	String get doctors => 'Doctors';

	/// en: 'Appointments'
	String get appointments => 'Appointments';

	/// en: 'Total Doctors'
	String get totalDoctors => 'Total Doctors';

	/// en: 'Doctor Deleted Successfully'
	String get doctorDeletedSuccessfully => 'Doctor Deleted Successfully';

	/// en: 'Clinic'
	String get clinic => 'Clinic';

	/// en: 'Dentistry'
	String get dentistry => 'Dentistry';

	/// en: 'Cardiology'
	String get cardiology => 'Cardiology';

	/// en: 'Ophthalmology'
	String get ophthalmology => 'Ophthalmology';

	/// en: 'Internal Medicine'
	String get internalMedicine => 'Internal Medicine';

	/// en: 'Today, $date'
	String todayDate({required Object date}) => 'Today, ${date}';

	/// en: 'Book Now'
	String get bookNow => 'Book Now';

	/// en: '$cost / hour'
	String doctorHourlyRate({required Object cost}) => '${cost} / hour';

	/// en: 'Hello, $name'
	String greeting({required Object name}) => 'Hello, ${name}';

	/// en: 'No slots available'
	String get noSlotsAvailable => 'No slots available';

	/// en: '1 slot available'
	String get oneSlotAvailable => '1 slot available';

	/// en: '$count slots available'
	String availableSlots({required Object count}) => '${count} slots available';

	/// en: 'AM'
	String get am => 'AM';

	/// en: 'PM'
	String get pm => 'PM';

	/// en: 'Please select a $title'
	String selectValue({required Object title}) => 'Please select a ${title}';

	/// en: '1 Minute'
	String get oneMinuteDuration => '1 Minute';

	/// en: '$count Minutes'
	String minutesDuration({required Object count}) => '${count} Minutes';

	/// en: '1 Hour'
	String get oneHourDuration => '1 Hour';

	/// en: '$count Hours'
	String hoursDuration({required Object count}) => '${count} Hours';

	/// en: '1 Hour $minutes Minutes'
	String oneHourAndMinutesDuration({required Object minutes}) => '1 Hour ${minutes} Minutes';

	/// en: '$hours Hours 1 Minute'
	String hoursAndOneMinuteDuration({required Object hours}) => '${hours} Hours 1 Minute';

	/// en: '$hours Hours $minutes Minutes'
	String hoursAndMinutesDuration({required Object hours, required Object minutes}) => '${hours} Hours ${minutes} Minutes';

	/// en: 'Saturday'
	String get saturday => 'Saturday';

	/// en: 'Sunday'
	String get sunday => 'Sunday';

	/// en: 'Monday'
	String get monday => 'Monday';

	/// en: 'Tuesday'
	String get tuesday => 'Tuesday';

	/// en: 'Wednesday'
	String get wednesday => 'Wednesday';

	/// en: 'Thursday'
	String get thursday => 'Thursday';

	/// en: 'Friday'
	String get friday => 'Friday';

	/// en: 'Patient care should always come first.'
	String get doctorServicePatientCare => 'Patient care should always come first.';

	/// en: 'If you run a clinic, you know how challenging it can be.'
	String get doctorServicePractice => 'If you run a clinic, you know how challenging it can be.';

	/// en: 'That’s why an appointment reminder system can help.'
	String get doctorServiceAppointmentReminder => 'That’s why an appointment reminder system can help.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'favouriteDoctors' => 'Favourite Doctors',
			'specialistCardiology' => 'Specialist Cardiology',
			'specialistCancer' => 'Specialist Cancer',
			'specialistMedicine' => 'Specialist Medicine',
			'specialistDentist' => 'Specialist Dentist',
			'Appointment' => 'Appointment',
			'AppointmentFor' => 'Appointment For',
			'WhoIsThisPatient' => 'Who is this patient?',
			'Next' => 'Next',
			'mySelf' => 'My self',
			'myChild' => 'My child',
			'mySon' => 'My son',
			'createDoctor' => 'Create Doctor',
			'doctorName' => 'Doctor Name',
			'enterDoctorName' => 'Enter Doctor Name',
			'speciality' => 'Speciality',
			'selectSpeciality' => 'Select Speciality',
			'doctorImage' => 'Doctor Image',
			'chooseYourRole' => 'Choose your role',
			'roleDescription' => 'The selected role determines the experience and available features.',
			'patientRole' => 'Patient',
			'administrator' => 'Administrator',
			'patientRoleDescription' => 'Book appointments and find doctors for your care.',
			'administratorRoleDescription' => 'Manage doctors and their availability.',
			'findTrustedDoctors' => 'Find Trusted Doctors',
			'chooseBestDoctors' => 'Choose Best Doctors',
			'easyAppointments' => 'Easy Appointments',
			'onboardingDescription' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 2000 years ago.',
			'getStarted' => 'Get Started',
			'skip' => 'Skip',
			'welcomeBack' => 'Welcome back',
			'joinUsToStartSearching' => 'Join us to start searching',
			'authDescription' => 'Search for doctors, book appointments, and find the care you need.',
			'email' => 'Email',
			'password' => 'Password',
			'name' => 'Name',
			'signIn' => 'Sign in',
			'signingIn' => 'Signing in...',
			'signUp' => 'Sign up',
			'signingUp' => 'Signing up...',
			'forgotPassword' => 'Forgot password',
			'forgotPasswordQuestion' => 'Forgot password?',
			'dontHaveAccountJoinUs' => 'Don’t have an account? Join us',
			'haveAccountLogIn' => 'Have an account? Log in',
			'enterEmailVerificationDescription' => 'Enter your email for verification. We will send a 4-digit code to your email.',
			'enter4DigitsCode' => 'Enter 4-digit code',
			'enter4DigitsCodeDescription' => 'Enter the 4-digit code you received by email.',
			'resetPassword' => 'Reset Password',
			'resetPasswordDescription' => 'Set a new password for your account so you can log in and access all the features.',
			'newPassword' => 'New Password',
			'reEnterPassword' => 'Re-enter Password',
			'updatePassword' => 'Update Password',
			'checkYourEmail' => 'Check your email',
			'continueAction' => 'Continue',
			'sending' => 'Sending...',
			'completeProfile' => 'Complete Profile',
			'contactNumber' => 'Contact Number',
			'phoneNumberExample' => 'e.g. 01006828614',
			'save' => 'Save',
			'saveChanges' => 'Save Changes',
			'update' => 'Update',
			'create' => 'Create',
			'loading' => 'Loading...',
			'field' => 'Field',
			'fieldRequired' => ({required Object fieldName}) => '${fieldName} is required',
			'fieldMinLength' => ({required Object fieldName, required Object length}) => '${fieldName} must be at least ${length} characters',
			'emailRequired' => 'Email is required',
			'validEmailRequired' => 'Enter a valid email address',
			'passwordRequired' => 'Password is required',
			'passwordMinLength' => ({required Object length}) => 'Password must be at least ${length} characters',
			'passwordUppercaseRequired' => 'Password must contain at least one uppercase letter',
			'passwordLowercaseRequired' => 'Password must contain at least one lowercase letter',
			'passwordNumberRequired' => 'Password must contain at least one number',
			'confirmPasswordRequired' => 'Confirm password is required',
			'passwordsDoNotMatch' => 'Passwords do not match',
			'phoneRequired' => 'Phone number is required',
			'validPhoneRequired' => 'Enter a valid phone number',
			'termsAgreementRequired' => 'You must agree to the terms',
			'otpCodeRequired' => 'Enter the OTP code',
			'otpMustHaveDigits' => ({required Object digits}) => 'OTP must be ${digits} digits',
			'termsAgreement' => 'I agree with the Terms of Service & Privacy Policy',
			'findYourDoctor' => 'Find Your Doctor',
			'search' => 'Search...',
			'searchDoctors' => 'Search doctors',
			'seeAll' => 'See all >',
			'popularDoctor' => 'Popular Doctor',
			'featuredDoctor' => 'Feature Doctor',
			'popularDoctors' => 'Popular Doctors',
			'featuredDoctors' => 'Feature Doctors',
			'dentist' => 'Dentist',
			'doctorDetails' => 'Doctor Details',
			'pageNotFound' => 'Page Not Found',
			'errorDescription' => 'Something went wrong. Please try again later.',
			'somethingWentWrong' => 'Something went wrong',
			'retry' => 'Retry',
			'settings' => 'Settings',
			'profile' => 'Profile',
			'privacyPolicy' => 'Privacy policy',
			'accountSettings' => 'Account settings',
			'moreOptions' => 'More options',
			'changePassword' => 'Change Password',
			'notifications' => 'Notifications',
			'patientUser' => 'Patient User',
			'privacyPolicyHeading' => 'Doctor Hunt Apps Privacy Policy',
			'privacyPolicyParagraphOne' => 'Many variations of Lorem Ipsum passages are available, but most have been changed in some way by added humor or altered words. It is a long-established fact that readers are distracted by readable content when looking at a page layout.',
			'privacyPolicyParagraphTwo' => 'It is a long-established fact that readers are distracted by readable content when looking at a page layout. The point of using Lorem Ipsum is that it has a more natural distribution of letters.',
			'logout' => 'Log Out',
			'logoutConfirmation' => 'Are you sure you want to log out?',
			'cancel' => 'Cancel',
			'ok' => 'OK',
			'addImage' => 'Add Image',
			'chooseProfileImage' => 'Choose Profile Image',
			'appointmentDetails' => 'Appointment Details',
			'appointmentDate' => 'Appointment date',
			'appointmentTime' => 'Appointment time',
			'consultationFee' => 'Consultation fee',
			'clinicLocation' => 'Clinic Location',
			'date' => 'Date',
			'time' => 'Time',
			'fee' => 'Fee',
			'rating' => 'Rating',
			'appointmentStatusUpcoming' => 'Upcoming',
			'appointmentStatusCancelled' => 'Cancelled',
			'appointmentStatusCompleted' => 'Completed',
			'viewDetails' => 'View Details',
			'cancelAppointment' => 'Cancel Appointment',
			'rateDoctor' => 'Rate Doctor',
			'markAsCompleted' => 'Mark as completed',
			'noAppointments' => 'No Appointments',
			'bookingCancelledSuccessfully' => 'Booking cancelled successfully',
			'appointmentMarkedSuccessfully' => 'Appointment marked successfully',
			'ratedSuccessfully' => 'Rated successfully',
			'tapToRateYourVisit' => 'Tap to rate your visit',
			'noDoctorsFound' => 'No Doctors Found',
			'active' => 'Active',
			'notActive' => 'Not Active',
			'manageDoctorQuestion' => 'Manage Doctor?',
			'manageDoctorDescription' => 'Update the doctor\'s information or remove the doctor from your account',
			'delete' => 'Delete',
			'addDoctor' => 'Add Doctor',
			'uploadDoctorImage' => 'Upload Doctor Image',
			'tapToPickImage' => 'Tap to pick an image',
			'doctorAddedSuccessfully' => 'Doctor Added Successfully',
			'doctorUpdatedSuccessfully' => 'Doctor Updated Successfully',
			'doctorAvailability' => 'Doctor Availability',
			'workingDays' => 'Working Days',
			'workingHours' => 'Working Hours',
			'daysEnabled' => ({required Object count}) => '${count} days enabled',
			'oneDayEnabled' => '1 day enabled',
			'noDaysAvailable' => 'No days available',
			'startTime' => 'Start Time',
			'endTime' => 'End Time',
			'slotDuration' => 'Slot Duration',
			'slotDurationExample' => 'e.g. 90',
			'minutes' => 'Minutes',
			'slotsAddedSuccessfully' => 'Slots Added Successfully',
			'workingDaysUpdatedSuccessfully' => 'Working Days Updated Successfully',
			'specialtyClinic' => ({required Object specialty}) => '${specialty} Clinic',
			'selectTime' => 'Select Time',
			'availableTime' => 'Available Time',
			'confirm' => 'Confirm',
			'afternoonSlots' => ({required Object count}) => 'Afternoon (${count} slots)',
			'eveningSlots' => ({required Object count}) => 'Evening (${count} slots)',
			'thankYou' => 'Thank You!',
			'appointmentSuccessful' => 'Your appointment was successful',
			'appointmentConfirmation' => ({required Object doctor, required Object date, required Object time}) => 'You booked an appointment with Dr. ${doctor} on ${date}, at ${time}',
			'done' => 'Done',
			'patientName' => 'Patient Name',
			'fullName' => 'Full Name',
			'enterYourName' => 'Enter your name',
			'enterYourFullName' => 'Enter your full name',
			'enterYourEmailAddress' => 'Enter your email address',
			'editProfile' => 'Edit Profile',
			'updateDoctor' => 'Update Doctor',
			'doctors' => 'Doctors',
			'appointments' => 'Appointments',
			'totalDoctors' => 'Total Doctors',
			'doctorDeletedSuccessfully' => 'Doctor Deleted Successfully',
			'clinic' => 'Clinic',
			'dentistry' => 'Dentistry',
			'cardiology' => 'Cardiology',
			'ophthalmology' => 'Ophthalmology',
			'internalMedicine' => 'Internal Medicine',
			'todayDate' => ({required Object date}) => 'Today, ${date}',
			'bookNow' => 'Book Now',
			'doctorHourlyRate' => ({required Object cost}) => '${cost} / hour',
			'greeting' => ({required Object name}) => 'Hello, ${name}',
			'noSlotsAvailable' => 'No slots available',
			'oneSlotAvailable' => '1 slot available',
			'availableSlots' => ({required Object count}) => '${count} slots available',
			'am' => 'AM',
			'pm' => 'PM',
			'selectValue' => ({required Object title}) => 'Please select a ${title}',
			'oneMinuteDuration' => '1 Minute',
			'minutesDuration' => ({required Object count}) => '${count} Minutes',
			'oneHourDuration' => '1 Hour',
			'hoursDuration' => ({required Object count}) => '${count} Hours',
			'oneHourAndMinutesDuration' => ({required Object minutes}) => '1 Hour ${minutes} Minutes',
			'hoursAndOneMinuteDuration' => ({required Object hours}) => '${hours} Hours 1 Minute',
			'hoursAndMinutesDuration' => ({required Object hours, required Object minutes}) => '${hours} Hours ${minutes} Minutes',
			'saturday' => 'Saturday',
			'sunday' => 'Sunday',
			'monday' => 'Monday',
			'tuesday' => 'Tuesday',
			'wednesday' => 'Wednesday',
			'thursday' => 'Thursday',
			'friday' => 'Friday',
			'doctorServicePatientCare' => 'Patient care should always come first.',
			'doctorServicePractice' => 'If you run a clinic, you know how challenging it can be.',
			'doctorServiceAppointmentReminder' => 'That’s why an appointment reminder system can help.',
			_ => null,
		};
	}
}
