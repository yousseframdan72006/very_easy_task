import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'data/task_model.dart';
import 'home_actions.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_states.dart';
import 'widgets/home_task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _hasError  = false;

  Future<void> _refresh() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  void _toggleError() => setState(() => _hasError = !_hasError);

  HomeStateType get _currentState {
    if (_isLoading) return HomeStateType.loading;
    if (_hasError) return HomeStateType.error;
    if (mockTasks.isEmpty) return HomeStateType.empty;
    return HomeStateType.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(
              onRefresh:     _refresh,
              onToggleError: _toggleError,
            ),
            Expanded(
              child: HomeStateView(
                state: _currentState,
                onRetry: _toggleError,
                child: HomeTaskList(
                  tasks: mockTasks,
                  onTap: (task) => HomeActions.openDetail(context, task),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
