import 'package:alarm_clock/app_bottom_bar.dart';
import 'package:alarm_clock/modules/timer/controllers/timer_controller.dart';
import 'package:alarm_clock/modules/timer/widgets/running_timer_text.dart';
import 'package:alarm_clock/modules/timer/widgets/start_timer_inputs.dart';
import 'package:alarm_clock/modules/timer/widgets/timer_buttons.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  final myTimer = MyTimer.timer;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer',textDirection: TextDirection.ltr),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            AnimatedBuilder(animation: myTimer, builder: (context, child) {
              return !myTimer.isStarted 
              ? const StartTimerInputs() 
              : const RunningTimerText();
            },),
            const TimerButtons(),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomBar()
    );
  }
}