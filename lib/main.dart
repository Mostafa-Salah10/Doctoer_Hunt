import 'package:doctor_hunt/app/doctor_hunt.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([SharedPreferencesHelper().init()]);
  runApp(const DoctorHunt());
}
