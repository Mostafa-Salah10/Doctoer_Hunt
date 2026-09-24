// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_enitity.dart';
import 'package:doctor_hunt/core/functions/toast_alert.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/custom_drop_down_menu.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/create_doctor/create_doctor_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/create_doctor/admin_create_doctor_image_container.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/custom_text_header.dart';
import 'package:doctor_hunt/gen/strings.g.dart';

class AdminCreateDoctorForm extends StatefulWidget {
  const AdminCreateDoctorForm({
    super.key,
    this.doctor,
    required AdminHomeCubit adminHomeCubit,
  }) : _adminHomeCubit = adminHomeCubit;

  final DoctorEnitity? doctor;
  final AdminHomeCubit _adminHomeCubit;

  @override
  State<AdminCreateDoctorForm> createState() => _AdminCreateDoctorFormState();
}

class _AdminCreateDoctorFormState extends State<AdminCreateDoctorForm> {
  String doctorName = '';

  String doctorSpeciality = '';

  @override
  void initState() {
    if (isEdit) {
      doctorName = widget.doctor!.name;
      doctorSpeciality = widget.doctor!.speciality;
    }
    super.initState();
  }

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
            intialValue: widget.doctor?.name,
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
                initialValue: widget.doctor?.speciality,
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
                previous.doctorImage != current.doctorImage ||
                previous.updateDoctor != current.updateDoctor,
            listenWhen: (previous, current) =>
                previous.createDoctor != current.createDoctor ||
                previous.updateDoctor != current.updateDoctor,
            listener: (context, state) {
              if (state.createDoctor.isError || state.updateDoctor.isError) {
                toastAlert(
                  msg: isEdit
                      ? state.updateDoctor.error!
                      : state.createDoctor.error!,
                  color: AppColors.errorColor,
                );
              } else if (state.createDoctor.isSuccess ||
                  state.updateDoctor.isSuccess) {
                toastAlert(
                  msg: isEdit
                      ? 'Doctor Updated Successfully'
                      : 'Doctor Added Successfully',
                  color: AppColors.primaryColor,
                );
                context.pop();
                widget._adminHomeCubit.getAllDoctors();
              }
            },
            builder: (context, state) {
              return AppButton(
                text:
                    state.createDoctor.isLoading || state.updateDoctor.isLoading
                    ? "Loading..."
                    : isEdit
                    ? "Update"
                    : "Create",
                onPressed: () {
                  final isValid = cubit.formKey.currentState!.validate();

                  if (!isValid) return;

                  if (isEdit) {
                    cubit.updateDoctor(
                      doctor: DoctorEnitity(
                        id: widget.doctor!.id,
                        name: doctorName,
                        imageUrl: widget.doctor!.imageUrl,
                        isActive: widget.doctor!.isActive,
                        speciality: doctorSpeciality,
                      ),
                    );
                  } else {
                    cubit.createDoctor(
                      doctorName: doctorName,
                      doctorSpeciality: doctorSpeciality,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  bool get isEdit => widget.doctor != null;
}
