import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/appointment/data/models/who_patient_model.dart';
import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhoIsPatientList extends StatelessWidget {
  const WhoIsPatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 149.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => const HorizontalSpace(width: 10),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: WhoPatientModel.patients.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: GestureDetector(
            onTap: () {
              if (index == 0) {
              } else {}
            },
            child: WhoPatientListItem(patient: WhoPatientModel.patients[index]),
          ),
        ),
      ),
    );
  }
}

class WhoPatientListItem extends StatelessWidget {
  const WhoPatientListItem({super.key, required this.patient});

  final WhoPatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(patient.image, width: 100.w, fit: BoxFit.cover),
        ),
        const VerticalSpace(height: 7),
        Text(
          patient.title.isEmpty ? "" : t[patient.title],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: context.textTheme.titleSmall,
        ),
      ],
    );
  }
}
