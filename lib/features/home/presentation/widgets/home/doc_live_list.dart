import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/doctor_live_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorLiveList extends StatelessWidget {
  DoctorLiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const HorizontalSpace(width: 14.52),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _doctorsThumbnail.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: DoctorLiveListItem(doctorThumbnail: _doctorsThumbnail[index]),
        ),
      ),
    );
  }

  final List<String> _doctorsThumbnail = [
    Assets.assetsImagesLiveDocOne,
    Assets.assetsImagesLiveDocTwo,
    Assets.assetsImagesLiveDocThree,
  ];
}
