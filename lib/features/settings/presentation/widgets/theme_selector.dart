import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/config/theme/manager/theme_cubit.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        final isDarkMode =
            state.themeMode == ThemeMode.dark ||
            (state.themeMode == ThemeMode.system && context.isDarkMode);
        return Row(
          spacing: 16,
          children: [
            CircleAvatar(
              radius: 24,
              child: Icon(
                isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                color: AppColors.primaryColor,
                size: 22.sp,
              ),
            ),
            Expanded(
              child: Text(
                context.t.darkMode,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: context.textTheme.bodyLarge,
              ),
            ),
            Switch(
              value: isDarkMode,
              activeTrackColor: AppColors.primaryColor,
              activeThumbColor: AppColors.lightBackgroundColor,
              onChanged: (enabled) {
                context.read<ThemeCubit>().changeTheme(
                  themeMode: enabled ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
