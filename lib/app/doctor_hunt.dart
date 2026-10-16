import 'package:doctor_hunt/core/config/routing/app_router.dart';
import 'package:doctor_hunt/core/config/language/manager/language_cubit.dart';
import 'package:doctor_hunt/core/config/theme/app_theme.dart';
import 'package:doctor_hunt/core/config/theme/manager/theme_cubit.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/gen/strings.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => gi<ThemeCubit>()),
        BlocProvider(create: (_) => gi<LanguageCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            buildWhen: (previous, current) => previous.locale != current.locale,
            builder: (context, languageState) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                ensureScreenSize: true,
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: AppStrings.appName,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: themeState.themeMode,
                    routerConfig: AppRouter.router,
                    locale: languageState.locale.flutterLocale,
                    supportedLocales: AppLocaleUtils.supportedLocales,
                    localizationsDelegates:
                        GlobalMaterialLocalizations.delegates,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
