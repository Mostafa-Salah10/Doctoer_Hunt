import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/auth/data/models/role_model.dart';
import 'package:doctor_hunt/features/auth/presentation/choose_role/widgets/choose_role_list_item.dart';
import 'package:flutter/material.dart';

class ChooseRoleList extends StatefulWidget {
  const ChooseRoleList({super.key, required this.onRoleSelected});
  final ValueChanged<Role> onRoleSelected;

  @override
  State<ChooseRoleList> createState() => _ChooseRoleListState();
}

class _ChooseRoleListState extends State<ChooseRoleList> {
  ValueNotifier<Role> currentRole = ValueNotifier(Role.patient);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const VerticalSpace(height: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: RoleModel.roles.length ,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (currentRole.value == RoleModel.roles[index].role) return;
          widget.onRoleSelected(RoleModel.roles[index].role);
          currentRole.value = RoleModel.roles[index].role;
        },
        child: ValueListenableBuilder(
          valueListenable: currentRole,
          builder: (context, value, child) {
            return ChooseRoleListItem(
              role: RoleModel.roles[index],
              selectedRole: value,
            );
          },
        ),
      ),
    );
  }
}
