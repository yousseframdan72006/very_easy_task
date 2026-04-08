import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

enum HomeStateType { loading, error, empty, data }

class HomeStateView extends StatelessWidget {
  final HomeStateType state;
  final VoidCallback? onRetry;
  final Widget? child; // The actual list

  const HomeStateView({
    super.key,
    required this.state,
    this.onRetry,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case HomeStateType.loading:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 52.w,
                height: 52.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.neonCyan),
                ),
              ),
              SizedBox(height: 16.h),
              Text('Syncing tasks…', style: AppTextStyles.bodySmall),
            ],
          ),
        );

      case HomeStateType.error:
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.wifi_off_rounded,
                    color: AppColors.accentRose, size: 60.sp),
                SizedBox(height: 16.h),
                Text('Something went wrong', style: AppTextStyles.heading2),
                SizedBox(height: 8.h),
                Text(
                  'Could not load your tasks. Please try again.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(height: 24.h),
                if (onRetry != null)
                  GestureDetector(
                    onTap: onRetry,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        gradient: AppColors.neonGradient,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.neonCyan.withOpacity(0.3),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Text(
                        'Retry',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.bgDeep,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );

      case HomeStateType.empty:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.inbox_outlined,
                  color: AppColors.textMuted, size: 60.sp),
              SizedBox(height: 12.h),
              Text(
                'No tasks found',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );

      case HomeStateType.data:
        return child ?? const SizedBox();
    }
  }
}
