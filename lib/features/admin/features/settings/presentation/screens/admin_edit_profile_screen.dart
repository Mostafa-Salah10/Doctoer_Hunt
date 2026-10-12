import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/widgets/admin_edit_profile_form.dart';
import 'package:doctor_hunt/features/admin/features/settings/presentation/widgets/admin_settings_change_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileScreen extends StatelessWidget {
  const AdminEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const AdminSetttingsTopChangeProfileImage(),
                    AdminEditProfileForm(
                      formKey: GlobalKey<FormState>(),
                      nameController: TextEditingController(),
                      emailController: TextEditingController(),
                      locationController: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const Spacer(),
                    AppButton(
                      text: 'Save Changes',
                      onPressed: () {},
                    ),
                    const VerticalSpace(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}