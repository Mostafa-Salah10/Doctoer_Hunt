import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/widgets/sign_up_agree_with_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.role});
  final Role role;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email = "";
  String name = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        children: [
          const VerticalSpace(height: 34),
          AppTextFormField(
            hint: "Name",
            validator: (value) => AppValidators.required(value),
            onChanged: (value) => name = value,
          ),
          const VerticalSpace(height: 18),
          AppTextFormField(
            hint: "Email",
            validator: (value) => AppValidators.email(value),
            onChanged: (value) => email = value,
          ),
          const VerticalSpace(height: 18),
          BlocBuilder<SignUpCubit, SignUpState>(
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
                      context.read<SignUpCubit>().togglePasswordIcon(),
                ),
                obscureText: !state.showPassword,
              );
            },
          ),
          const VerticalSpace(height: 18),
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) =>
                previous.agreeWithTerms != current.agreeWithTerms,
            builder: (context, state) {
              return SignUpAgreeWithTerms(
                isChecked: state.agreeWithTerms,
                onChanged: (value) => cubit.toggleAgreeWithTerms(value),
              );
            },
          ),
          const VerticalSpace(height: 55),
          BlocConsumer<SignUpCubit, SignUpState>(
            listenWhen: (previous, current) =>
                current.signUp != previous.signUp,
            buildWhen: (previous, current) => current.signUp != previous.signUp,
            listener: (context, state) {
              if (state.signUp.isSuccess) {
                context.pushReplacementNamed(AppRoutes.signIn);
              } else if (state.signUp.isError) {
                toastAlert(
                  msg: state.signUp.error!,
                  color: AppColors.errorColor,
                );
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state.signUp.isLoading ? "Signing up..." : "Sign up",
                onPressed: () {
                  if (state.signUp.isLoading) return;
                  cubit.signUpWithEmailAndPassword(
                    email: email,
                    password: password,
                    name: name,
                    role: widget.role,
                  );
                },
              );
            },
          ),
          const VerticalSpace(height: 17),
          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(AppRoutes.signIn);
            },
            child: Text(
              "Have an account? Log in",
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
