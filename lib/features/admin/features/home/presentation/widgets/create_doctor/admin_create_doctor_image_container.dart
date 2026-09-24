import 'dart:io';

import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/extensions/size_extension.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/create_doctor/create_doctor_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCreateDoctorImageContainer extends StatelessWidget {
  const AdminCreateDoctorImageContainer({super.key, this.image});

  final File? image;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateDoctorCubit>();
    return image != null
        ? SizedBox(
            width: double.infinity,
            height: context.height * 0.24,
            child: Image.file(image!),
          )
        : GestureDetector(
            onTap: () {
              cubit.pickDoctorImage();
            },
            child: SizedBox(
              width: double.infinity,
              height: context.height * 0.24,
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(15),
                  dashPattern: [10, 5],
                  strokeWidth: .4,
                  padding: EdgeInsets.all(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined, size: 40, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Upload Doctor Image',
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: context.isDarkMode
                              ? AppColors.lightBackgroundColor
                              : AppColors.darkBackgroundColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tap to pick an image',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
