import 'package:doctor_hunt/core/config/language/manager/language_cubit.dart';
import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        return Container(
          height: 39.h,
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.primaryColor, width: 1.h),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  context.t.language,
                  style: context.textTheme.bodyLarge,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 150.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AppLocale>(
                    value: state.locale,
                    isDense: true,
                    borderRadius: BorderRadius.circular(14.r),
                    menuMaxHeight: 280.h,
                    dropdownColor: context.isDarkMode
                        ? AppColors.darkBackgroundColor
                        : AppColors.lightBackgroundColor,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primaryColor,
                    ),
                    selectedItemBuilder: (context) => AppLocale.values
                        .map(
                          (locale) => Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              _localeName(context, locale),
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    items: AppLocale.values
                        .map(
                          (locale) => DropdownMenuItem(
                            value: locale,
                            child: Text(
                              _localeName(context, locale),
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (locale) {
                      if (locale != null) {
                        context.read<LanguageCubit>().changeLanguage(
                          locale: locale,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _localeName(BuildContext context, AppLocale locale) {
    final names = {
      AppLocale.en: context.t.english,
      AppLocale.ar: context.t.arabic,
    };
    return names[locale] ?? locale.name;
  }
}
