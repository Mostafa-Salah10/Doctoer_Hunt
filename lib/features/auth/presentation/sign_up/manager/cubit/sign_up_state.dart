part of 'sign_up_cubit.dart';

@immutable
class SignUpState {
  final bool showPassword;
  final BoxState signUp;
  final BoxState completeInfo;
  final bool agreeWithTerms;
  final File? profileImage;
  

  const SignUpState({
  required this.completeInfo,
    this.profileImage,
    required this.agreeWithTerms,
    required this.signUp,
    required this.showPassword,
  });

  SignUpState.init()
    : this(
      completeInfo: BoxState.initial(),
        profileImage: null,
        signUp: BoxState.initial(),
        showPassword: false,
        agreeWithTerms: false,
      );

  SignUpState copyWith({
    BoxState ?completeInfo,
    bool? showPassword,
    BoxState? signUp,
    File? profileImage,
    bool? agreeWithTerms,
  }) => SignUpState(
    completeInfo: completeInfo??this.completeInfo,
    profileImage: profileImage ?? this.profileImage,
    showPassword: showPassword ?? this.showPassword,
    signUp: signUp ?? this.signUp,
    agreeWithTerms: agreeWithTerms ?? this.agreeWithTerms,
  );
}
