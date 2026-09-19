import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/custom_drop_down_menu.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/create_doctor/create_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/create_doctor/admin_create_doctor_image_container.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/custom_text_header.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminCreateDoctorForm extends StatefulWidget {
  const AdminCreateDoctorForm({super.key});

  @override
  State<AdminCreateDoctorForm> createState() => _AdminCreateDoctorFormState();
}

class _AdminCreateDoctorFormState extends State<AdminCreateDoctorForm> {
  String doctorName = '';

  String doctorSpeciality = '';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateDoctorCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextHeader(text: t.doctorName),

          AppTextFormField(
            onChanged: (name) {
              doctorName = name;
            },
            validator: AppValidators.required,
            hint: t.enterDoctorName,
            prefixIcon: Icon(
              Icons.person,
              color: AppColors.greyColor,
              size: 23,
            ),
          ),

          const VerticalSpace(height: 30),

          CustomTextHeader(text: t.speciality),

          BlocConsumer<CreateDoctorCubit, CreateDoctorState>(
            buildWhen: (previous, current) =>
                previous.getDoctorSpecialities != current.getDoctorSpecialities,
            listenWhen: (previous, current) =>
                previous.getDoctorSpecialities != current.getDoctorSpecialities,
            listener: (context, state) {
              if (state.getDoctorSpecialities.isError) {
                toastAlert(
                  msg: state.getDoctorSpecialities.error!,
                  color: AppColors.errorColor,
                );
              }
            },
            builder: (context, state) {
              return CustomDropDownMenu<String>(
                title: t.speciality,
                items: state.getDoctorSpecialities.isSuccess
                    ? state.getDoctorSpecialities.data!
                          .map(
                            (speciality) => DropDownMenuItemModel(
                              title: speciality.speciality,
                              value: speciality.speciality,
                            ),
                          )
                          .toList()
                    : [],
                onSelect: (speciality) {
                  doctorSpeciality =
                      speciality ??
                      state.getDoctorSpecialities.data!.first.speciality;
                },
              );
            },
          ),

          const VerticalSpace(height: 30),

          CustomTextHeader(text: t.doctorImage),

          const VerticalSpace(height: 10),

          BlocBuilder<CreateDoctorCubit, CreateDoctorState>(
            buildWhen: (previous, current) =>
                previous.doctorImage != current.doctorImage,
            builder: (context, state) {
              return AdminCreateDoctorImageContainer(image: state.doctorImage);
            },
          ),

          const VerticalSpace(height: 70),

          BlocConsumer<CreateDoctorCubit, CreateDoctorState>(
            buildWhen: (previous, current) =>
                previous.createDoctor != current.createDoctor ||
                previous.doctorImage != current.doctorImage,
            listenWhen: (previous, current) =>
                previous.createDoctor != current.createDoctor,
            listener: (context, state) {
              if (state.createDoctor.isError) {
                toastAlert(
                  msg: state.createDoctor.error!,
                  color: AppColors.errorColor,
                );
              } else if (state.createDoctor.isSuccess) {
                toastAlert(
                  msg: 'Doctor Added Successfully',
                  color: AppColors.primaryColor,
                );
                context.pop();
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state.createDoctor.isLoading
                    ? "Created..."
                    : t.createDoctor,
                onPressed: () {
                  final isValid = cubit.formKey.currentState!.validate();

                  if (!isValid) return;
                  if (state.doctorImage == null) return;

                  cubit.createDoctor(
                    doctorName: doctorName,
                    doctorSpeciality: doctorSpeciality,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
