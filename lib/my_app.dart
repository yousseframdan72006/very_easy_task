import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vary_easy_task/core/theme/app_theme.dart';
import 'features/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Vary Easy Task',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
