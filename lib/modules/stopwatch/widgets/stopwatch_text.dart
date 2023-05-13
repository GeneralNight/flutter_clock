import 'package:alarm_clock/modules/stopwatch/controllers/stopwatch_controller.dart';
import 'package:flutter/material.dart';

class StopWatchText extends StatefulWidget {
  const StopWatchText({super.key});

  @override
  State<StopWatchText> createState() => _StopWatchTextState();
}

class _StopWatchTextState extends State<StopWatchText> {

  final stopWatch = MyStopwatch.stopwatch;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: stopWatch, builder: (context, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stopWatch.hours.toString().padLeft(2,'0'),
            style: const TextStyle(fontSize: 42),
          ),
          const Text(" : ", style: TextStyle(fontSize: 42),),
          Text(
            stopWatch.minutes.toString().padLeft(2,'0'),
            style: const TextStyle(fontSize: 42),
          ),
          const Text(" : ", style: TextStyle(fontSize: 42),),
          Text(
            stopWatch.seconds.toString().padLeft(2,'0'),
            style: const TextStyle(fontSize: 42),
          ),
        ],
      );
    },);
  }
}