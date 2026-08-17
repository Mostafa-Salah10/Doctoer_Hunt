part of 'sign_in_cubit.dart';

class SignInState {
  final bool showPassword;
  final bool showNewPassword;
  final bool showReEnterPassword;
  final BoxState signIn;
  final BoxState forgotPass;
  final BoxState sendOtp;
  final BoxState resetPassword;
  final bool validEmail;

  const SignInState({
    required this.showNewPassword,
    required this.showReEnterPassword,
    required this.resetPassword,
    required this.sendOtp,
    required this.forgotPass,
    required this.validEmail,
    required this.signIn,
    required this.showPassword,
  });

  SignInState.init()
    : this(
        showNewPassword: false,
        showReEnterPassword: false,
        resetPassword: BoxState.initial(),
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
    BoxState? resetPassword,
    bool? showNewPassword,
    bool? showReEnterPassword,
  }) => SignInState(
    showNewPassword: showNewPassword ?? this.showNewPassword,
    showReEnterPassword: showReEnterPassword ?? this.showReEnterPassword,
    resetPassword: resetPassword ?? this.resetPassword,
    sendOtp: sendOtp ?? this.sendOtp,
    forgotPass: forgotPass ?? this.forgotPass,
    showPassword: showPassword ?? this.showPassword,
    validEmail: validEmail ?? this.validEmail,
    signIn: signIn ?? this.signIn,
  );
}
