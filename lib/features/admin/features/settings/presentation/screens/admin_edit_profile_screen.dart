import 'package:doctor_hunt/features/admin/features/settings/data/models/admin_model.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/manager/admin_settings_cubit.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/widgets/admin_edit_profile_form.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/widgets/admin_settings_change_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileScreen extends StatelessWidget {
  const AdminEditProfileScreen({super.key, required this.admin});

  final AdminModel admin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<AdminSettingsCubit, AdminSettingsState>(
              buildWhen: (previous, current) =>
                  previous.profileImage != current.profileImage,
              builder: (context, state) {
                return AdminSetttingsTopChangeProfileImage(
                  admin: admin,
                  image: state.profileImage,
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AdminEditProfileForm(admin: admin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
