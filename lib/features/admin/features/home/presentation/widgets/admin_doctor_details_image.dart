import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdminDoctorDetailsImage extends StatelessWidget {
  const AdminDoctorDetailsImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 120.w,
          height: 120.h,

          decoration: BoxDecoration(shape: BoxShape.circle),

          child: CustomCachedNetworkImage(imageUrl: image),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset(
            Assets.assetsSvgsDoctorVerificationIcon,
            width: 32.w,
            height: 32.h,
          ),
        ),
      ],
    );
  }
}
