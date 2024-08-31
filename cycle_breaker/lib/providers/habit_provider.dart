// providers/habit_provider.dart
import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitProvider with ChangeNotifier {
  Habit? _habit;

  Habit? get habit => _habit;

  void startTracking(String name) {
    _habit = Habit(name: name, startTime: DateTime.now());
    notifyListeners();
  }

  void stopTracking() {
    _habit = null;
    notifyListeners();
  }
}
