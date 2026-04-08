import 'package:flutter/material.dart';
import 'data/task_model.dart';
import '../detail/detail_screen.dart';

abstract final class HomeActions {
  /// Navigate to [DetailScreen] with a material route.
  static void openDetail(BuildContext context, TaskItem task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(task: task)),
    );
  }
}
