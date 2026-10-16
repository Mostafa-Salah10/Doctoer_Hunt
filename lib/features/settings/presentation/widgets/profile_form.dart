import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/core/widgets/ustom_admin_text_field.dart';
import 'package:doctor_hunt/features/settings/data/models/patient_model.dart';
import 'package:doctor_hunt/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key, required this.patient});
  final PatientModel patient;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formState = GlobalKey<FormState>();
  String phone = '';
  String name = '';

  @override
  void initState() {
    phone = widget.patient.phone;
    name = widget.patient.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: _formState,

        child: Column(
          children: [
            const VerticalSpace(height: 20),
            CustomAdminTextField(
              initialValue: name,
              onChanged: (n) {
                name = n;
              },
              hint: 'enter your name',
              label: 'Full Name',
              prefixIcon: Icon(
                Icons.person_outline,
                size: 24.sp,
                color: const Color(0xFF8DA0BB),
              ),
              validator: (name) =>
                  AppValidators.required(name, fieldName: "Name"),
            ),

            const VerticalSpace(height: 20),
            CustomAdminTextField(
              onChanged: (ph) {
                phone = ph;
              },
              hint: 'ex : 01006828614',
              initialValue: phone,
              label: 'Contact Number',
              keyboardType: TextInputType.number,
              prefixIcon: Icon(
                Icons.phone_iphone_outlined,
                size: 24.sp,
                color: const Color(0xFF8DA0BB),
              ),
              validator: (name) =>
                  AppValidators.required(name, fieldName: "Phone"),
            ),
            const Spacer(),
            BlocConsumer<SettingsCubit, SettingsState>(
              buildWhen: (previous, current) =>
                  previous.updateCurrentPatient != current.updateCurrentPatient,
              listener: (context, state) {
                if (state.updateCurrentPatient.isError) {
                  toastAlert(
                    msg: "Something went wrong",
                    color: AppColors.errorColor,
                  );
                } else if (state.updateCurrentPatient.isSuccess) {
                  context.pop();
                }
              },
              builder: (context, state) {
                return SafeArea(
                  child: AppButton(
                    onPressed: () async {
                      if (state.updateCurrentPatient.isLoading) return;
                      if (_formState.currentState!.validate()) {
                        cubit.updateCurrentPatient(
                          PatientModel(
                            patientId: widget.patient.patientId,
                            imageUrl: widget.patient.imageUrl,
                            email: widget.patient.email,
                            phone: phone,
                            name: name,
                            image: cubit.state.profileImage,
                          ),
                        );
                      }
                    },
                    text: state.updateCurrentPatient.isLoading
                        ? "Loading..."
                        : "Save",
                  ),
                );
              },
            ),
            const VerticalSpace(height: 20),
          ],
        ),
      ),
    );
  }
}
