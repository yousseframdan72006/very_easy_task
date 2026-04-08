import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../home/data/task_model.dart';

class DetailProgressSection extends StatefulWidget {
  final TaskItem task;

  const DetailProgressSection({super.key, required this.task});

  @override
  State<DetailProgressSection> createState() =>
      _DetailProgressSectionState();
}

class _DetailProgressSectionState extends State<DetailProgressSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.task.accent;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: AppTextStyles.heading3),
              AnimatedBuilder(
                animation: _anim,
                builder: (_, __) {
                  final v =
                      (_anim.value * widget.task.progress).toStringAsFixed(0);
                  return Text('$v%',
                      style: AppTextStyles.neon(size: 20)
                          .copyWith(color: color));
                },
              ),
            ],
          ),
          SizedBox(height: 14.h),
          LayoutBuilder(builder: (_, c) {
            return AnimatedBuilder(
              animation: _anim,
              builder: (_, __) {
                final pct = _anim.value * widget.task.progress / 100;
                return Stack(
                  children: [
                    Container(
                      height: 10.h,
                      width: c.maxWidth,
                      decoration: BoxDecoration(
                        color: AppColors.textMuted.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: c.maxWidth * pct,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color.withOpacity(0.6), color],
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
