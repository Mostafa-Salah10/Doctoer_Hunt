part of 'sign_in_cubit.dart';

class SignInState {
  final bool showPassword;
  final BoxState signIn;
  final bool validEmail;

  const SignInState({
    required this.validEmail,
    required this.signIn,
    required this.showPassword,
  });

  SignInState.init()
    : this(signIn: BoxState.initial(), showPassword: false, validEmail: false);

  SignInState copyWith({
    bool? showPassword,
    BoxState? signIn,
    bool? validEmail,
  }) => SignInState(
    showPassword: showPassword ?? this.showPassword,
    validEmail: validEmail ?? this.validEmail,
    signIn: signIn ?? this.signIn,
  );
}
