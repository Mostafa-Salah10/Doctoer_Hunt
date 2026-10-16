import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseRoleTopTextSection extends StatelessWidget {
  const ChooseRoleTopTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 32),

        Center(
          child: SvgPicture.asset(
            Assets.assetsSvgsAppLogo,
            height: 70.h,
            width: 70.h,
          ),
        ),

        const VerticalSpace(height: 11),

        Text("Doctor Hunt", style: context.textTheme.headlineSmall),
        const VerticalSpace(height: 50),

        Text(context.t.chooseYourRole, style: context.textTheme.headlineLarge),
        const VerticalSpace(height: 8),

        Text(
          textAlign: TextAlign.center,
          context.t.roleDescription,
          style: context.textTheme.titleSmall,
        ),
        const VerticalSpace(height: 32),
      ],
    );
  }
}
