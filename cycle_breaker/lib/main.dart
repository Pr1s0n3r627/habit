// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/habit_provider.dart';
import 'screens/habit_screen.dart';

void main() {
  runApp(const CycleBreakerApp());
}

class CycleBreakerApp extends StatelessWidget {
  const CycleBreakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HabitProvider()),
      ],
      child: MaterialApp(
        title: 'Cycle Breaker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HabitScreen(),
        },
      ),
    );
  }
}
