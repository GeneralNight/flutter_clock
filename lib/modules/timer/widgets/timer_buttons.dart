import 'package:alarm_clock/modules/timer/controllers/timer_controller.dart';
import 'package:flutter/material.dart';

class TimerButtons extends StatefulWidget {
  const TimerButtons({super.key});

  @override
  State<TimerButtons> createState() => _TimerButtonsState();
}

class _TimerButtonsState extends State<TimerButtons> {

  final myTimer = MyTimer.timer;  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: myTimer, builder: (context, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: !myTimer.isStarted || myTimer.isRunning 
            ? null 
            : () {
              myTimer.reset();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32)))),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
            ),
            child: Text(
              "Dismiss",
              style: TextStyle(color: !myTimer.isStarted || myTimer.isRunning  ? Colors.black54 : Colors.black),
            ),
          ),
          Container(width: 40,),
          TextButton(
            onPressed: myTimer.time==0 ? null : () {
              !myTimer.isStarted 
              ? myTimer.startTimer()
              : myTimer.isRunning 
              ? myTimer.stopTimer() 
              : myTimer.continueTimer();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32)))),
              backgroundColor: myTimer.time == 0 
              ? MaterialStateProperty.all(Colors.purple.withOpacity(.6))
              : myTimer.isRunning && myTimer.isStarted
              ? MaterialStateProperty.all(Colors.red) 
              : MaterialStateProperty.all(Colors.deepPurple),
              
            ), 
            child: Text(
              !myTimer.isStarted 
              ? "Start"
              : myTimer.isRunning 
              ? "Pause"
              : "Continue",
              style: const TextStyle(color: Colors.white),
            ),)
        ],
      );
    },);
  }
}