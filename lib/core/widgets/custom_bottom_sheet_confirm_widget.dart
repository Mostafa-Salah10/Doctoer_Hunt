import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:doctor_hunt/core/extensions/config_extension.dart';
import 'package:doctor_hunt/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetConfirmWidget extends StatelessWidget {
  const CustomBottomSheetConfirmWidget({
    super.key,
    required this.title,
    required this.description,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    this.onCancel, this.confirmColor, this.cancelColor=AppColors.primaryColor,
  });

  final String title;
  final String description;

  final String confirmText;
  final String cancelText;

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  final Color? confirmColor;
  final Color? cancelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 13,
        children: [
          const UnderLineWidget(),
          _buildTitle(context),
          const Divider(thickness: 0.3),
          _buildDescription(context),
          const SizedBox(height: 10),
          _buildButtons(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: context.isDarkMode
            ? AppColors.lightBackgroundColor
            : AppColors.darkblackText,
      ),
    );
  }

  Text _buildDescription(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      description,
      style: Theme.of(
        context,
      ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            color: cancelColor,
            onPressed: onCancel,
            text: cancelText,
            height: 45,
            fontSize: 15,
            shape: const StadiumBorder(),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: AppButton(
            onPressed: onConfirm,
            text: confirmText,
            height: 45,
            fontSize: 15,
            shape: const StadiumBorder(),
          ),
        ),
      ],
    );
  }
}

class UnderLineWidget extends StatelessWidget {
  const UnderLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      decoration: BoxDecoration(
        color: AppColors.darkBackgroundColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
