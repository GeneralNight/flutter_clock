import 'package:alarm_clock/app_bottom_bar.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer',textDirection: TextDirection.ltr),
      ),
      bottomNavigationBar: const AppBottomBar()
    );
  }
}