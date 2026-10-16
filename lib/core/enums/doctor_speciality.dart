import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/widgets.dart';

enum DoctorSpeciality {
  dentistry,
  cardiology,
  ophthalmology,
  internalMedicine;

  DoctorSpeciality fromString({required String speciality}) {
    return DoctorSpeciality.values.firstWhere(
      (s) => speciality.toLowerCase() == s.name.toLowerCase(),
    );
  }

  String toStringValue() {
    switch (this) {
      case DoctorSpeciality.dentistry:
        return 'Dentistry';
      case DoctorSpeciality.cardiology:
        return 'Cardiology';
      case DoctorSpeciality.ophthalmology:
        return 'Ophthalmology';
      case DoctorSpeciality.internalMedicine:
        return 'Internal Medicine';
    }
  }

  String localizedName(BuildContext context) => switch (this) {
    DoctorSpeciality.dentistry => context.t.dentistry,
    DoctorSpeciality.cardiology => context.t.cardiology,
    DoctorSpeciality.ophthalmology => context.t.ophthalmology,
    DoctorSpeciality.internalMedicine => context.t.internalMedicine,
  };
}
