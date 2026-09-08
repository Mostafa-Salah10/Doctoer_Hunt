import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/widgets/forgot_pass_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignInForm> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Form(
      key: cubit.signInFormKey,
      child: Column(
        children: [
          const VerticalSpace(height: 34),
          BlocBuilder<SignInCubit, SignInState>(
            buildWhen: (previous, current) =>
                previous.validEmail != current.validEmail,
            builder: (context, state) {
              return AppTextFormField(
                hint: "Email",
                validator: (value) => AppValidators.email(value),
                onChanged: (value) {
                  cubit.validateEmail(value);
                  email = value;
                },
                suffixIcon: state.validEmail
                    ? Icon(Icons.done, color: AppColors.greyColor)
                    : null,
              );
            },
          ),
          const VerticalSpace(height: 18),
          BlocBuilder<SignInCubit, SignInState>(
            buildWhen: (previous, current) =>
                previous.showPassword != current.showPassword,
            builder: (context, state) {
              return AppTextFormField(
                hint: "Password",
                validator: (value) => AppValidators.password(value),
                onChanged: (value) => password = value,
                suffixIcon: IconButton(
                  icon: Icon(
                    state.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () =>
                      context.read<SignInCubit>().togglePasswordIcon(),
                ),
                obscureText: !state.showPassword,
              );
            },
          ),

          const VerticalSpace(height: 32),
          BlocConsumer<SignInCubit, SignInState>(
            buildWhen: (previous, current) => previous.signIn != current.signIn,
            listenWhen: (previous, current) =>
                previous.signIn != current.signIn,
            listener: (context, state) {
              if (state.signIn.isSuccess) {
                _navigateToRightRoue(state.signIn.data);
              } else if (state.signIn.isError) {
                toastAlert(
                  msg: state.signIn.error!,
                  color: AppColors.errorColor,
                );
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state.signIn.isLoading ? "Signing in..." : "Sign in",
                onPressed: () {
                  if (state.signIn.isLoading) return;
                  cubit.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                },
              );
            },
          ),
          const VerticalSpace(height: 19),

          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: gi<SignInCubit>(),
                  child: ForgotPasswordBottomSheet(),
                ),
              );
            },
            child: Text(
              textAlign: TextAlign.center,
              "Forgot password?",
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),

          const VerticalSpace(height: 123),
          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(AppRoutes.chooseRole);
            },
            child: Text(
              textAlign: TextAlign.center,
              "Don’t have an account? Join us",
              style: context.textTheme.titleSmall!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _navigateToRightRoue(Role role) async {
    await SharedPreferencesHelper().set(
      key: AppStrings.role,
      value: role.index,
    );

    if (!mounted) return;

    switch (role) {
      case Role.patient:
        context.pushNamedAndRemoveUntil(AppRoutes.bottomNavBar);
        break;
      case Role.doctor:
      case Role.admin:
        context.pushNamedAndRemoveUntil(AppRoutes.adminbottomNavBar);
        break;
    }
  }
}
