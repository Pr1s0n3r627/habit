// providers/habit_provider.dart
import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitProvider with ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void addHabit(String name) {
    _habits.add(Habit(name: name, startTime: DateTime.now()));
    notifyListeners();
  }

  void removeHabit(Habit habit) {
    _habits.remove(habit);
    notifyListeners();
  }

  void stopTracking(Habit habit) {
    _habits.remove(habit);
    notifyListeners();
  }
}
