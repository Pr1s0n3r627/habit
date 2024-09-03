// screens/habit_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import '../widgets/habit_timer.dart';
import '../utils/theme.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cycle Breaker'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: habitProvider.habits.length,
                itemBuilder: (context, index) {
                  final habit = habitProvider.habits[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppDimensions.spacing),
                    child: Card(
                      child: HabitTimer(habit: habit),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                padding: const EdgeInsets.all(AppDimensions.buttonPadding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
                ),
              ),
              onPressed: () {
                _showAddHabitDialog(context);
              },
              child: const Text('Add New Habit'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddHabitDialog(BuildContext context) {
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
                  .addHabit(habitController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
