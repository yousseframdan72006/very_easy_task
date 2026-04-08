import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/data/task_model.dart';
import 'detail_action_button.dart';
import 'detail_description.dart';
import 'detail_info_row.dart';
import 'detail_progress_section.dart';
import 'detail_section_label.dart';

class DetailBody extends StatelessWidget {
  final TaskItem task;

  const DetailBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        DetailProgressSection(task: task),
        SizedBox(height: 24.h),
        const DetailSectionLabel(text: 'About'),
        SizedBox(height: 10.h),
        DetailDescription(text: task.description),
        SizedBox(height: 24.h),
        const DetailSectionLabel(text: 'Details'),
        SizedBox(height: 10.h),
        DetailInfoRow(label: 'Category', value: task.category),
        DetailInfoRow(
          label: 'Status',
          value: task.isCompleted ? 'Completed ✅' : 'In Progress',
        ),
        DetailInfoRow(label: 'Progress', value: '${task.progress}%'),
        DetailInfoRow(label: 'Task ID',  value: '#${task.id}'),
        SizedBox(height: 32.h),
        DetailActionButton(
          onTap: () => Navigator.of(context).pop(),
        ),
      ]),
    );
  }
}
