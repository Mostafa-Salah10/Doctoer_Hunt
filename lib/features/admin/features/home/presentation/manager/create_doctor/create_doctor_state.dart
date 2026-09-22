part of 'create_doctor_cubit.dart';

class CreateDoctorState {
  final BoxState<List<DocotorSpecialityEntity>> getDoctorSpecialities;
  final BoxState<void> createDoctor;
  final BoxState<void> updateDoctor;
  final File? doctorImage;

  CreateDoctorState({
    required this.getDoctorSpecialities,
    required this.createDoctor,
    required this.doctorImage,

    required this.updateDoctor,
  });

  CreateDoctorState.init()
    : this(
        getDoctorSpecialities: BoxState.initial(),
        createDoctor: BoxState.initial(),
        doctorImage: null,
        updateDoctor: BoxState.initial(),
      );

  CreateDoctorState copyWith({
    BoxState<List<DocotorSpecialityEntity>>? getDoctorSpecialities,
    BoxState? createDoctor,
    File? doctorImage,

    BoxState? updateDoctor,
  }) {
    return CreateDoctorState(
      doctorImage: doctorImage ?? this.doctorImage,
      createDoctor: createDoctor ?? this.createDoctor,
      updateDoctor: updateDoctor ?? this.updateDoctor,
      getDoctorSpecialities:
          getDoctorSpecialities ?? this.getDoctorSpecialities,
    );
  }
}
