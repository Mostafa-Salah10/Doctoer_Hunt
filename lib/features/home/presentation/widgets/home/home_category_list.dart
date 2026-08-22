import 'package:doctor_hunt/core/widgets/space_widget.dart';
import 'package:doctor_hunt/features/home/data/models/home_category_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/home/home_category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const HorizontalSpace(width: 14.52),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: HomeCategoryModel.categories.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: HomeCategoryListItem(
            category: HomeCategoryModel.categories[index],
          ),
        ),
      ),
    );
  }
}
