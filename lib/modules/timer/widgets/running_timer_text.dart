import 'package:alarm_clock/modules/timer/controllers/timer_controller.dart';
import 'package:flutter/material.dart';

class RunningTimerText extends StatefulWidget {
  const RunningTimerText({super.key});

  @override
  State<RunningTimerText> createState() => _RunningTimerTextState();
}

class _RunningTimerTextState extends State<RunningTimerText> {

  final myTimer = MyTimer.timer;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: myTimer, builder: (context, child) {
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              
              SizedBox(
                width: 250,
                height: 250,
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                  backgroundColor: Colors.black.withOpacity(.2),
                  value: myTimer.time.toDouble() / myTimer.initialTime.toDouble(),
                  strokeWidth: 8,
                ),
              ),
              Text(
                "${myTimer.hours.toString().padLeft(2,"0")} : ${myTimer.minutes.toString().padLeft(2,"0")} : ${myTimer.seconds.toString().padLeft(2,"0")}",
                style: const TextStyle(fontSize: 32),
              )
            ],
          )
        ],
      );
    });
  }
}