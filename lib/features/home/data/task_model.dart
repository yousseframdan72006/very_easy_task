import 'package:flutter/material.dart';

class TaskItem {
  final String id;
  final String title;
  final String description;
  final String category;
  final int progress; // 0–100
  final bool isCompleted;
  final Color accent;
  final IconData icon;

  const TaskItem({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.progress,
    required this.isCompleted,
    required this.accent,
    required this.icon,
  });
}

// ── Mock Data ─────────────────────────────────────────────────────
const List<TaskItem> mockTasks = [
  TaskItem(
    id: '1',
    title: 'Design System Setup',
    description: 'Define tokens, typography & color palette for the new app.',
    category: 'Design',
    progress: 100,
    isCompleted: true,
    accent: Color(0xFF00E5FF),
    icon: Icons.palette_outlined,
  ),
  TaskItem(
    id: '2',
    title: 'ScreenUtil Integration',
    description: 'Integrate flutter_screenutil and make all screens responsive.',
    category: 'Dev',
    progress: 85,
    isCompleted: false,
    accent: Color(0xFF0EFFC4),
    icon: Icons.phone_android_outlined,
  ),
  TaskItem(
    id: '3',
    title: 'Navigation Architecture',
    description: 'Implement named routes and smooth page transitions.',
    category: 'Dev',
    progress: 60,
    isCompleted: false,
    accent: Color(0xFFFFD166),
    icon: Icons.route_outlined,
  ),
  TaskItem(
    id: '4',
    title: 'UI States Handling',
    description: 'Loading, empty and error states with animated feedback.',
    category: 'UX',
    progress: 40,
    isCompleted: false,
    accent: Color(0xFFFF6B9D),
    icon: Icons.layers_outlined,
  ),
  TaskItem(
    id: '5',
    title: 'Export & Packaging',
    description: 'Bundle source + export + README into task ZIP file.',
    category: 'Delivery',
    progress: 20,
    isCompleted: false,
    accent: Color(0xFFB388FF),
    icon: Icons.folder_zip_outlined,
  ),
];
