part of 'sign_up_cubit.dart';

@immutable
class SignUpState {
  final bool showPassword;
  final BoxState signUp;
  final bool agreeWithTerms;

  const SignUpState({
    required this.agreeWithTerms,
    required this.signUp,
    required this.showPassword,
  });

  SignUpState.init()
    : this(
        signUp: BoxState.initial(),
        showPassword: false,
        agreeWithTerms: false,
      );


  SignUpState copyWith({
    bool? showPassword,
    BoxState? signUp,
    bool? agreeWithTerms,
  }) => SignUpState(
    showPassword: showPassword ?? this.showPassword,
    signUp: signUp ?? this.signUp,
    agreeWithTerms: agreeWithTerms ?? this.agreeWithTerms,
  );
}
