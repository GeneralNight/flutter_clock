
import 'package:alarm_clock/app_bottom_bar.dart';
import 'package:alarm_clock/modules/stopwatch/controllers/stopwatch_controller.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {

  final stopWatch = MyStopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch',textDirection: TextDirection.ltr),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(animation: stopWatch, builder: (context, child) {
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
            },),
            AnimatedBuilder(animation: stopWatch, builder: (context, child) {
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
            },)

          ],
        ),
      ),
      bottomNavigationBar: const AppBottomBar()
    );
  }
}