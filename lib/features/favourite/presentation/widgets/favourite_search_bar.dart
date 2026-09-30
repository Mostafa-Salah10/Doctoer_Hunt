import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/assets.dart';
import 'package:doctor_hunt/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.title,
    required this.onSearch,
  });
  final String title;
  final ValueChanged<String> onSearch;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: AppTextFormField(
        controller: _controller,
        hint: widget.title,
        onChanged: widget.onSearch,
        borderRadius: 6.r,
        prefixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            Assets.assetsSvgsSearch,
            width: 12,
            height: 12,
            colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
        ),

        suffixIcon: InkWell(
          onTap: () {
            _controller.clear();
          },
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              Assets.assetsSvgsClose,
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                AppColors.greyColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
