import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../home/data/task_model.dart';

class DetailHeader extends StatelessWidget {
  final TaskItem task;

  const DetailHeader({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220.h,
      pinned: true,
      backgroundColor: AppColors.bgCard,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.textMuted.withOpacity(0.3)),
          ),
          child: Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.neonCyan, size: 16.sp),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                task.accent.withOpacity(0.15),
                AppColors.bgDeep,
              ],
              begin: Alignment.topCenter,
              end:   Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: task.accent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                          color: task.accent.withOpacity(0.4), width: 1.5),
                    ),
                    child:
                        Icon(task.icon, color: task.accent, size: 28.sp),
                  ),
                  SizedBox(height: 14.h),
                  Text(task.title, style: AppTextStyles.heading1),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      _Chip(label: task.category, color: task.accent),
                      if (task.isCompleted) ...[
                        SizedBox(width: 8.w),
                        _Chip(label: 'Done ✅', color: AppColors.neonTeal),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;

  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption
            .copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
