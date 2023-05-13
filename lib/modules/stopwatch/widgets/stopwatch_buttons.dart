import 'package:alarm_clock/modules/stopwatch/controllers/stopwatch_controller.dart';
import 'package:flutter/material.dart';

class StopWatchButtons extends StatefulWidget {
  const StopWatchButtons({super.key});

  @override
  State<StopWatchButtons> createState() => _StopWatchButtonsState();
}

class _StopWatchButtonsState extends State<StopWatchButtons> {

  final stopWatch = MyStopwatch.stopwatch;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: stopWatch, builder: (context, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: !stopWatch.isStarted || stopWatch.isRunning 
            ? null 
            : () {
              stopWatch.reset();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32)))),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
            ),
            child: Text(
              "Reset",
              style: TextStyle(color: !stopWatch.isStarted || stopWatch.isRunning  ? Colors.black54 : Colors.black),
            ),
          ),
          Container(width: 40,),
          TextButton(
            onPressed: () {
              !stopWatch.isStarted 
              ? stopWatch.startTimer() 
              : stopWatch.isRunning 
              ? stopWatch.stopTimer() 
              : stopWatch.continueTimer();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32)))),
              backgroundColor: stopWatch.isRunning && stopWatch.isStarted 
              ? MaterialStateProperty.all(Colors.red) 
              : MaterialStateProperty.all(Colors.deepPurple),
              
            ), 
            child: Text(
              !stopWatch.isStarted 
              ? "Start"
              : stopWatch.isRunning 
              ? "Pause"
              : "Continue",
              style: const TextStyle(color: Colors.white),
            ),)
        ],
      );
    },);
  }
}