import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extenstioin.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.title,
    required this.items,
    this.initialValue,
    this.onSelect,
    this.validator,
  });

  final String title;
  final List<DropDownMenuItemModel<T>> items;
  final T? initialValue;
  final ValueChanged<T?>? onSelect;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: initialValue,
      onChanged: onSelect,
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item.value,
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          )
          .toList(),

      hint: Text(title, style: context.textTheme.bodyLarge),

      icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.greyColor),

      iconSize: 26,

      dropdownColor: context.isDarkMode
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,

      decoration: InputDecoration(
        filled: true,
        fillColor: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greyColor),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),

      validator:
          validator ??
          (value) {
            if (value == null) {
              return "Please select a $title";
            }

            return null;
          },
    );
  }
}

class DropDownMenuItemModel<T> {
  final String title;
  final T value;

  const DropDownMenuItemModel({required this.title, required this.value});
}
