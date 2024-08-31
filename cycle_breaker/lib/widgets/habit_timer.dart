// widgets/habit_timer.dart
import 'package:cycle_breaker/providers/habit_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit.dart';

class HabitTimer extends StatelessWidget {
  final Habit habit;

  const HabitTimer({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tracking Habit: ${habit.name}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        _buildElapsedTime(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Provider.of<HabitProvider>(context, listen: false).stopTracking();
          },
          child: const Text('Stop Tracking'),
        ),
      ],
    );
  }

  Widget _buildElapsedTime() {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        final elapsed = DateTime.now().difference(habit.startTime);
        final hours = elapsed.inHours.toString().padLeft(2, '0');
        final minutes = (elapsed.inMinutes % 60).toString().padLeft(2, '0');
        final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');
        return Text(
          '$hours:$minutes:$seconds',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
