import 'package:doctor_hunt/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorContent extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorContent({super.key, required this.onRetry});

  bool _isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).shortestSide >= 600;

  double _spacing(BuildContext context) => _isTablet(context) ? 24.0 : 16.0;

  double _horizontalPadding(BuildContext context) =>
      _isTablet(context) ? 64.0 : 32.0;

  double _buttonWidth(BuildContext context) =>
      _isTablet(context) ? 240.0 : 200.0;

  double _buttonHeight(BuildContext context) =>
      _isTablet(context) ? 54.0 : 48.0;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double spacing = _spacing(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min, // <-- المهم: ياخد حجمه بس، مش يحاول يتمدد
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _DoubleGearIcon(isDark: isDark),
          SizedBox(height: spacing * 1.3),
          Text(
            'Page Not Found',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: isDark
                  ? AppColors.lightBackgroundColor
                  : AppColors.blackColor,
            ),
          ),
          SizedBox(height: spacing / 2),
          Text(
            'Something went wrong. Please try again later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: isDark
                  ? AppColors.lightBackgroundColor.withValues(alpha: 0.55)
                  : AppColors.blackColor.withValues(alpha: 0.5),
              height: 1.6,
            ),
          ),
          SizedBox(height: spacing * 1.5),
          SizedBox(
            width: _buttonWidth(context),
            height: _buttonHeight(context),
            child: ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.lightBackgroundColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Retry',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightBackgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DoubleGearIcon extends StatelessWidget {
  const _DoubleGearIcon({required this.isDark});

  final bool isDark;

  bool _isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).shortestSide >= 600;

  double _bigGear(BuildContext context) => _isTablet(context) ? 110.0 : 85.0;

  double _smallGear(BuildContext context) =>
      _isTablet(context) ? 65.0 : 50.0;

  @override
  Widget build(BuildContext context) {
    final double bigGear = _bigGear(context);
    final double smallGear = _smallGear(context);
    final double containerSize = bigGear + smallGear * 0.6;

    return SizedBox(
      width: containerSize,
      height: containerSize * 0.85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Icon(
              Icons.settings_rounded,
              size: bigGear,
              color: AppColors.primaryColor,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.settings_outlined,
              size: smallGear,
              color: isDark
                  ? AppColors.lightBackgroundColor.withValues(alpha: 0.9)
                  : AppColors.blackColor.withValues(alpha: 0.2),
            ),
          ),
        ],
      ),
    );
  }
}