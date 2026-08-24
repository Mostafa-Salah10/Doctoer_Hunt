import 'package:doctor_hunt/app/doctor_hunt.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([SharedPreferencesHelper().init()]);
  setupServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(TranslationProvider(child: const DoctorHunt()));
}
