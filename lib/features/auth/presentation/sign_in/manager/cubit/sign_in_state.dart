part of 'sign_in_cubit.dart';

class SignInState {
  final bool showPassword;
  final BoxState signIn;
  final BoxState forgotPass;
  final BoxState sendOtp;
  final bool validEmail;

  const SignInState({
    required this.sendOtp,
    required this.forgotPass,
    required this.validEmail,
    required this.signIn,
    required this.showPassword,
  });

  SignInState.init()
    : this(
        signIn: BoxState.initial(),
        showPassword: false,
        validEmail: false,
        forgotPass: BoxState.initial(),
        sendOtp: BoxState.initial(),
      );

  SignInState copyWith({
    bool? showPassword,
    BoxState? signIn,
    bool? validEmail,
    BoxState? forgotPass,
    BoxState? sendOtp,
  }) => SignInState(
    sendOtp: sendOtp ?? this.sendOtp,
    forgotPass: forgotPass ?? this.forgotPass,
    showPassword: showPassword ?? this.showPassword,
    validEmail: validEmail ?? this.validEmail,
    signIn: signIn ?? this.signIn,
  );
}
