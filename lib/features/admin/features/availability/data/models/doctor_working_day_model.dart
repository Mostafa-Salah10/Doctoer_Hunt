import 'package:doctor_hunt/core/enums/week_days.dart';
import 'package:doctor_hunt/core/helpers/date_time_helper.dart';
import 'package:flutter/material.dart';

class DoctorWorkingDayModel {
  final Weekday weekday;
  bool isActive;

  DoctorWorkingDayModel({required this.weekday, this.isActive = false});

  static List<DoctorWorkingDayModel> get workingDays => [
    ...List.generate(
      Weekday.values.length,
      (index) =>
          DoctorWorkingDayModel(weekday: Weekday.values.elementAt(index)),
    ),
  ];

  factory DoctorWorkingDayModel.fromJson(
    Weekday weekday,
    Map<String, dynamic> json,
  ) {
    return DoctorWorkingDayModel(
      weekday: weekday,
      isActive: json[weekday.name.toLowerCase()] == true,
    );
  }
}

class DoctorAvailabilityModel {
  final List<DoctorWorkingDayModel> workingDays;
  TimeOfDay startTime;
  TimeOfDay endTime;
  double slotDuration;

  bool fristSet;

  DoctorAvailabilityModel({
    required this.workingDays,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,

    required this.fristSet,
  });

  DoctorAvailabilityModel.defaultData()
    : this(
        fristSet: true,
        endTime: TimeOfDay(hour: 17, minute: 0),
        startTime: TimeOfDay(hour: 9, minute: 0),
        workingDays: DoctorWorkingDayModel.workingDays,
        slotDuration: 30,
      );

  factory DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilityModel(
      fristSet: json['firstSet'],
      startTime: DateTimeHelper.formateTimeFromAMAndPM(json["startTime"]),
      endTime: DateTimeHelper.formateTimeFromAMAndPM(json['endTime']),
      slotDuration: (json['slotDuration'] as num).toDouble(),
      workingDays: Weekday.values.map((day) {
        return DoctorWorkingDayModel.fromJson(day, json['weeklySettings']);
      }).toList(),
    );
  }
}
