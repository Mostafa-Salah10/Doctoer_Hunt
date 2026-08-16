import 'package:doctor_hunt/app/doctor_hunt.dart';
import 'package:doctor_hunt/core/database/cache/shared_preferences_helper.dart';
import 'package:doctor_hunt/core/services/di/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SharedPreferencesHelper().init(),
    ScreenUtil.ensureScreenSize(),
  ]);
  setupServiceLocator();
  runApp(const DoctorHunt());
}
