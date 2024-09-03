// widgets/habit_timer.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit.dart';
import '../providers/habit_provider.dart';
import '../utils/theme.dart';

class HabitTimer extends StatelessWidget {
  final Habit habit;

  const HabitTimer({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        habit.name,
        style: TextStyle(
          fontSize: AppDimensions.habitTextSize,
          color: AppColors.habitTextColor,
        ),
      ),
      subtitle: _buildElapsedTime(),
      trailing: IconButton(
        icon: const Icon(Icons.stop),
        onPressed: () {
          Provider.of<HabitProvider>(context, listen: false).stopTracking(habit);
        },
      ),
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
          style: TextStyle(
            fontSize: AppDimensions.timerTextSize,
            fontWeight: FontWeight.bold,
            color: AppColors.habitTextColor,
          ),
        );
      },
    );
  }
}
