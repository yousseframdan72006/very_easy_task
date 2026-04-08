import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DetailDescription extends StatelessWidget {
  final String text;

  const DetailDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
    );
  }
}
