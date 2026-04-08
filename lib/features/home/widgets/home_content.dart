import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../data/task_model.dart';
import 'home_task_list.dart';

class HomeContent extends StatelessWidget {
  final bool                   isLoading;
  final bool                   hasError;
  final List<TaskItem>         tasks;
  final VoidCallback           onRetry;
  final ValueChanged<TaskItem> onTaskTap;

  const HomeContent({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.tasks,
    required this.onRetry,
    required this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return _buildLoading();
    if (hasError)  return _buildError();
    if (tasks.isEmpty) return _buildEmpty();
    return HomeTaskList(tasks: tasks, onTap: onTaskTap);
  }

  // ── Loading ───────────────────────────────
  Widget _buildLoading() {
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
  }

  // ── Error ─────────────────────────────────
  Widget _buildError() {
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
              'Could not load tasks. Please try again.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: onRetry,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
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
  }

  // ── Empty ─────────────────────────────────
  Widget _buildEmpty() {
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
  }
}
