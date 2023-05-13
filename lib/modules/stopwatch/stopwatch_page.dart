
import 'package:alarm_clock/app_bottom_bar.dart';
import 'package:alarm_clock/modules/stopwatch/controllers/stopwatch_controller.dart';
import 'package:alarm_clock/modules/stopwatch/widgets/stopwatch_buttons.dart';
import 'package:alarm_clock/modules/stopwatch/widgets/stopwatch_text.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {

  final stopWatch = MyStopwatch.stopwatch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch',textDirection: TextDirection.ltr),
      ),
      body: Container(
        color: Colors.white,
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StopWatchText(),
              
              
              StopWatchButtons()

            ],
          ),
      ),
      bottomNavigationBar: const AppBottomBar()
    );
  }
}