import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/enums/doctor_speciality.dart';
import 'package:doctor_hunt/core/enums/request_state.dart';
import 'package:doctor_hunt/core/helpers/box_state.dart';
import 'package:doctor_hunt/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeRepo homeRepo})
    : _homeRepo = homeRepo,
      super(HomeState.init());

  final HomeRepo _homeRepo;

  void changeCurrentSpeciality(DoctorSpeciality speciality, int limit) {
    emit(state.copyWith(currentSpeciality: speciality));
    getPopularDoctors(limit: limit);
    getFeatureDoctors(limit: limit);
  }

  Future<void> getPopularDoctors({required int limit}) async {
    emit(state.copyWith(getPopularDoctors: BoxState.loading()));

    final result = await _homeRepo.getPopularDoctors(
      limit: limit,
      speciality: state.currentSpeciality.name,
    );

    result.fold(
      (err) {
        emit(
          state.copyWith(
            errorTypes: ErrorTypes.server,
            getPopularDoctors: BoxState.error(),
          ),
        );
      },
      (doctors) {
        emit(
          state.copyWith(getPopularDoctors: BoxState.success(data: doctors)),
        );
      },
    );
  }

  Future<void> getFeatureDoctors({required int limit}) async {
    emit(state.copyWith(getFeatureDoctors: BoxState.loading()));

    final result = await _homeRepo.getFeatureDoctors(
      limit: limit,
      speciality: state.currentSpeciality.name,
    );

    result.fold(
      (err) => emit(
        state.copyWith(
          errorTypes: ErrorTypes.server,
          getFeatureDoctors: BoxState.error(),
        ),
      ),
      (doctors) {
        emit(
          state.copyWith(getFeatureDoctors: BoxState.success(data: doctors)),
        );
      },
    );
  }
}
