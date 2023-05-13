import 'package:alarm_clock/modules/timer/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class StartTimerInputs extends StatefulWidget {
  const StartTimerInputs({super.key});

  @override
  State<StartTimerInputs> createState() => _StartTimerInputsState();
}

class _StartTimerInputsState extends State<StartTimerInputs> {

  final myTimer = MyTimer.timer;
  
  int initialSeconds = 0;
  int initialMinutes = 0;
  int initialHours = 0;

  void _handleValueChanged(int value, String inputType) {
    switch (inputType) {
      case "hours":
        setState(() => initialHours = value);
      break;
      case "minutes":
        setState(() => initialMinutes = value);
      break;
      case "seconds":
        setState(() => initialSeconds = value);
      break;
    }
    myTimer.setTime(initialHours*3600+initialMinutes*60000+initialSeconds*1000);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberPicker(
          minValue: 0,
          maxValue: 23,
          value: initialHours,
          onChanged: (value) {
            _handleValueChanged(value,"hours");
          },
          infiniteLoop: true,
          zeroPad: true,
          textStyle: const TextStyle(fontSize: 30, color: Colors.black38, fontWeight: FontWeight.w400),
          selectedTextStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
        ),
        const Text(":",style:TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        NumberPicker(
          minValue: 0,
          maxValue: 59,
          value: initialMinutes,
          onChanged: (value) {
            _handleValueChanged(value,"minutes");
          },
          infiniteLoop: true,
          zeroPad: true,
          textStyle: const TextStyle(fontSize: 30, color: Colors.black38, fontWeight: FontWeight.w400),
          selectedTextStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
        ),
        const Text(":",style:TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        NumberPicker(
          minValue: 0,
          maxValue: 59,
          value: initialSeconds,
          onChanged: (value) {
            _handleValueChanged(value,"seconds");
          },
          infiniteLoop: true,
          zeroPad: true,
          textStyle: const TextStyle(fontSize: 30, color: Colors.black38, fontWeight: FontWeight.w400),
          selectedTextStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}