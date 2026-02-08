import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// App logo widget - red person/contact icon
class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({
    super.key,
    this.size = AppSpacing.iconXxl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        Icons.person,
        size: size * 0.6,
        color: AppColors.white,
      ),
    );
  }
}
