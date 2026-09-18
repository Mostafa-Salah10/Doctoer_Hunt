part of 'create_doctor_cubit.dart';

class CreateDoctorState {
  final BoxState<List<DocotorSpecialityEntity>> getDoctorSpecialities;

  CreateDoctorState({required this.getDoctorSpecialities});

  CreateDoctorState.init() : this(getDoctorSpecialities: BoxState.initial());

  CreateDoctorState copyWith({
    BoxState<List<DocotorSpecialityEntity>>? getDoctorSpecialities,
  }) {
    return CreateDoctorState(
      getDoctorSpecialities:
          getDoctorSpecialities ?? this.getDoctorSpecialities,
    );
  }
}
