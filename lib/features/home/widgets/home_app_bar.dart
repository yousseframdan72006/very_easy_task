import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import 'app_bar_avatar.dart';
import 'app_bar_icon_btn.dart';
import 'app_bar_titles.dart';

class HomeAppBar extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final VoidCallback             onToggleError;

  const HomeAppBar({
    super.key,
    required this.onRefresh,
    required this.onToggleError,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        children: [
          const AppBarTitles(),
          const Spacer(),
          AppBarIconBtn(
            icon: Icons.refresh_rounded,
            onTap: onRefresh,
          ),
          SizedBox(width: 8.w),
          AppBarIconBtn(
            icon: Icons.warning_amber_rounded,
            color: AppColors.accentRose,
            onTap: onToggleError,
          ),
          SizedBox(width: 8.w),
          const AppBarAvatar(),
        ],
      ),
    );
  }
}
