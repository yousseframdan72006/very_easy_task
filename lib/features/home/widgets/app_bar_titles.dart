import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class AppBarTitles extends StatelessWidget {
  const AppBarTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Dashboard', style: AppTextStyles.heading1),
        Text('Track your progress', style: AppTextStyles.bodySmall),
      ],
    );
  }
}
