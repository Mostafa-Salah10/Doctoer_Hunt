import 'package:doctor_hunt/core/config/routing/app_routes.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/extensions/navigate_extension.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/presentation/choose_role/widgets/choose_role_list.dart';
import 'package:doctor_hunt/features/auth/presentation/choose_role/widgets/choose_role_top_text_section.dart';
import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  Role role = Role.patient;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ChooseRoleTopTextSection(),
                Expanded(
                  child: ChooseRoleList(
                    onRoleSelected: (role) => this.role = role,
                  ),
                ),
              ],
            ),
          ),

          AppButton(
            text: "Continue",
            onPressed: () {
              context.pushReplacementNamed(AppRoutes.signUp, arguments: role);
            },
          ),
          const VerticalSpace(height: 32),
        ],
      ),
    );
  }
}
