import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/task_model.dart';
import 'task_card.dart';

class HomeTaskList extends StatelessWidget {
  final List<TaskItem>         tasks;
  final ValueChanged<TaskItem> onTap;

  const HomeTaskList({
    super.key,
    required this.tasks,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (_, i) => GestureDetector(
        onTap: () => onTap(tasks[i]),
        child: TaskCard(task: tasks[i], index: i),
      ),
    );
  }
}
