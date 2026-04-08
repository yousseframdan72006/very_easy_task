import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';

class AppBarIconBtn extends StatelessWidget {
  final IconData     icon;
  final VoidCallback onTap;
  final Color        color;

  const AppBarIconBtn({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.textMuted.withOpacity(0.3)),
        ),
        child: Icon(icon, color: color, size: 18.sp),
      ),
    );
  }
}
