part of 'create_doctor_cubit.dart';

class CreateDoctorState {
  final BoxState<List<DocotorSpecialityEntity>> getDoctorSpecialities;
  final BoxState<void> createDoctor;
  final File? doctorImage;

  CreateDoctorState({
    required this.getDoctorSpecialities,
    required this.createDoctor,
    required this.doctorImage,
  });

  CreateDoctorState.init()
    : this(
        getDoctorSpecialities: BoxState.initial(),
        createDoctor: BoxState.initial(),
        doctorImage: null,
      );

  CreateDoctorState copyWith({
    BoxState<List<DocotorSpecialityEntity>>? getDoctorSpecialities,
    BoxState? createDoctor,
    File? doctorImage,
  }) {
    return CreateDoctorState(
      doctorImage: doctorImage ?? this.doctorImage,
      createDoctor: createDoctor ?? this.createDoctor,
      getDoctorSpecialities:
          getDoctorSpecialities ?? this.getDoctorSpecialities,
    );
  }
}
