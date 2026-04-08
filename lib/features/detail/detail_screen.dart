import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import '../home/data/task_model.dart';
import 'widgets/detail_body.dart';
import 'widgets/detail_header.dart';

class DetailScreen extends StatelessWidget {
  final TaskItem task;

  const DetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          DetailHeader(task: task),
          SliverPadding(
            padding: EdgeInsets.all(20.w),
            sliver: DetailBody(task: task),
          ),
        ],
      ),
    );
  }
}
