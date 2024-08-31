// screens/habit_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import '../widgets/habit_timer.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);
    final habit = habitProvider.habit;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cycle Breaker'),
      ),
      body: Center(
        child: habit == null
            ? ElevatedButton(
                onPressed: () {
                  // Show a dialog to enter habit name
                  _showStartDialog(context);
                },
                child: const Text('Start Tracking a Habit'),
              )
            : HabitTimer(habit: habit),
      ),
    );
  }

  void _showStartDialog(BuildContext context) {
    final TextEditingController habitController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Habit Name'),
        content: TextField(controller: habitController),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<HabitProvider>(context, listen: false)
                  .startTracking(habitController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
