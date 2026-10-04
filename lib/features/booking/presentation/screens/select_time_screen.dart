import 'package:doctor_hunt/core/database/shared/domain/entities/doctor_entity.dart';
import 'package:doctor_hunt/core/widgets/custom_background_widget.dart';
import 'package:doctor_hunt/features/booking/presentation/manager/select_time_cubit.dart';
import 'package:doctor_hunt/features/booking/presentation/widgets/select_time_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  @override
  void initState() {
    // log(widget.doctor.id);
    context.read<SelectTimeCubit>().fetchDoctorAvailableDays(widget.doctor.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: SafeArea(child: SelectTimeScreenBody(doctor: widget.doctor)),
    );
  }
}
