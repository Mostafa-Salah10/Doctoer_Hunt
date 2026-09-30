part of 'home_cubit.dart';

class HomeState {
  final BoxState<List<DoctorEntity>> getPopularDoctors;
  final BoxState<List<DoctorEntity>> getFeatureDoctors;
  final BoxState<List<DoctorEntity>> getSearchedDoctors;
  final ErrorTypes? errorTypes;

  final DoctorSpeciality currentSpeciality;

  HomeState({
    required this.currentSpeciality,
    required this.getPopularDoctors,
    required this.getFeatureDoctors,
    this.errorTypes,

    required this.getSearchedDoctors,
  });

  HomeState.init()
    : this(
        currentSpeciality: DoctorSpeciality.dentistry,
        getFeatureDoctors: BoxState.initial(),
        getPopularDoctors: BoxState.initial(),
        errorTypes: null,
        getSearchedDoctors: BoxState.initial(),
      );

  HomeState copyWith({
    BoxState<List<DoctorEntity>>? getPopularDoctors,
    BoxState<List<DoctorEntity>>? getFeatureDoctors,
    ErrorTypes? errorTypes,
    DoctorSpeciality? currentSpeciality,
    BoxState<List<DoctorEntity>>? getSearchedDoctors,
  }) {
    return HomeState(
      getSearchedDoctors: getSearchedDoctors ?? this.getSearchedDoctors,
      currentSpeciality: currentSpeciality ?? this.currentSpeciality,
      getPopularDoctors: getPopularDoctors ?? this.getPopularDoctors,
      getFeatureDoctors: getFeatureDoctors ?? this.getFeatureDoctors,
      errorTypes: errorTypes,
    );
  }
}
