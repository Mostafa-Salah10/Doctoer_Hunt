import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorLiveListItem extends StatelessWidget {
  const DoctorLiveListItem({super.key, required this.doctorThumbnail});

  final String doctorThumbnail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116.48.w,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(doctorThumbnail, fit: BoxFit.fill),
          Container(color: Colors.black.withValues(alpha: 0.1)),
          Center(
            child: SvgPicture.asset(
              Assets.assetsSvgsPuase,
              width: 29.55330467224121.h,
              height: 29.55330467224121.h,
            ),
          ),
          Positioned(
            top: 13.h,
            right: 13.w,
            child: SvgPicture.asset(
              Assets.assetsSvgsLive,
              width: 40.31999969482422.w,
              height: 17.920000076293945.h,
            ),
          ),
        ],
      ),
    );
  }
}
