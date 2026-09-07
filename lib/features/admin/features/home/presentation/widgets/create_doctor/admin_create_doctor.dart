import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/helpers/app_validator.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:doctor_hunt/core/widgets/custom_drop_down_menu.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/create_doctor/admin_create_doctor_image_container.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/widgets/custom_text_header.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';

class AdminCreateDoctorForm extends StatelessWidget {
  AdminCreateDoctorForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextHeader(text: t.doctorName),

          AppTextFormField(
            validator: AppValidators.required,
            hint: t.enterDoctorName,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: AppColors.greyColor, size: 23),
            ),
          ),

          const VerticalSpace(height: 30),

          CustomTextHeader(text: t.speciality),

          CustomDropDownMenu<String>(
            title: t.speciality,
            items: [
              DropDownMenuItemModel(title: 'Cardiology', value: 'cardiology'),
              DropDownMenuItemModel(title: 'Cancer', value: 'cancer'),
              DropDownMenuItemModel(title: 'Medicine', value: 'medicine'),
              DropDownMenuItemModel(title: 'Dentist', value: 'dentist'),
            ],
            // initialValue: 'cardiology',
            onSelect: (value) {
              // selectedSpeciality = value;
            },
          ),

          const VerticalSpace(height: 30),

          CustomTextHeader(text: t.doctorImage),

          const VerticalSpace(height: 10),

          const AdminCreateDoctorImageContainer(),

          const VerticalSpace(height: 70),

          AppButton(
            text: t.createDoctor,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // Handle form submission
              }
            },
          ),
        ],
      ),
    );
  }
}
