import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
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
          AppButton(
            text: "Sign in",
            onPressed: () {
              if (cubit.signInFormKey.currentState!.validate()) {
                //sign in
              }
            },
          ),
          const VerticalSpace(height: 46),

          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(AppRoutes.chooseRole);
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
}
