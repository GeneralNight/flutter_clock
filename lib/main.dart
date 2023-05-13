import 'package:alarm_clock/modules/stopwatch/stopwatch_page.dart';
import 'package:alarm_clock/modules/timer/timer_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      routes: {
        '/stopwatch' : (context) => const StopwatchPage(),
        '/timer' : (context) => const TimerPage(),
      },
      initialRoute: '/stopwatch',
    );
  }
}