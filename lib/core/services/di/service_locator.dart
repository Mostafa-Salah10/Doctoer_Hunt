import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/core/config/theme/manager/theme_cubit.dart';
import 'package:doctor_hunt/core/database/shared/data/data_source/shared_remote_data_source.dart';
import 'package:doctor_hunt/core/database/shared/data/repo/shared_repo_impl.dart';
import 'package:doctor_hunt/core/database/shared/domain/usecases/get_all_doctors.dart';
import 'package:doctor_hunt/features/admin/features/home/data/data_source/admin_home_remote_data_source.dart';
import 'package:doctor_hunt/features/admin/features/home/data/repo/admin_home_repo_impl.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/create_doctor.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/delete_doctor.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/get_doctor_specialities.dart';
import 'package:doctor_hunt/features/admin/features/home/domain/use_case/update_doctor.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/admin_home/admin_home_cubit.dart';
import 'package:doctor_hunt/features/admin/features/home/presentation/manager/create_doctor/create_doctor_cubit.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo_impl.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:doctor_hunt/features/home/data/repo/home_repo_imp.dart';
import 'package:doctor_hunt/features/home/presentation/manager/home_cubit.dart';
import 'package:doctor_hunt/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final gi = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void setupServiceLocator() async {
  ///all repos
  gi.registerLazySingleton(
    () => AuthRepoImpl(
      fireStore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
  gi.registerLazySingleton(
    () => HomeRepoImp(firebaseFirestore: FirebaseFirestore.instance),
  );

  gi.registerLazySingleton(() => OnboardingCubit());
  gi.registerLazySingleton(() => ThemeCubit());
  gi.registerLazySingleton(
    () => AdminHomeRepoImpl(
      adminHomeRemoteDataSource: AdminHomeRemoteDataSource(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    ),
  );
  gi.registerLazySingleton(
    () => SharedRepoImpl(
      sharedRemoteDataSource: SharedRemoteDataSource(
        firebaseFirestore: FirebaseFirestore.instance,
      ),
    ),
  );

  ///all cubits

  gi.registerFactory(
    () => AdminHomeCubit(
      allDoctors: GetAllDoctors(sharedRepository: gi.get<SharedRepoImpl>()),
      deleteDoctor: DeleteDoctor(adminHomeRepo: gi.get<AdminHomeRepoImpl>()),
    ),
  );

  gi.registerFactory(() => SignUpCubit(authRepo: gi.get<AuthRepoImpl>()));
  gi.registerFactory(() => SignInCubit(authRepo: gi.get<AuthRepoImpl>()));
  gi.registerFactory(() => HomeCubit(homeRepo: gi<HomeRepoImp>()));
  gi.registerFactory(
    () => CreateDoctorCubit(
      getDoctorSpecialities: GetDoctorSpecialities(
        adminHomeRepo: gi.get<AdminHomeRepoImpl>(),
      ),
      updateDoctor: UpdateDoctor(adminHomeRepo: gi.get<AdminHomeRepoImpl>()),
      createDoctor: CreateDoctor(adminHomeRepo: gi.get<AdminHomeRepoImpl>()),
    ),
  );
}
