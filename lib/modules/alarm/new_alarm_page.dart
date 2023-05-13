import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class NewAlarmPage extends StatefulWidget {
  const NewAlarmPage({super.key});

  @override
  State<NewAlarmPage> createState() => _NewAlarmPageState();
}

class _NewAlarmPageState extends State<NewAlarmPage> {
  int _currentHourValue = 0;
  int _currentMinutesValue = 0;
  final alarmController = TextEditingController();
  bool alarmSound = true;
  bool alarmVibrate = true;
  bool alarmRepeat = true;

  

  _handleValueChanged(int value, String type) {
    type=='hour'
    ? setState(() => _currentHourValue = value) 
    : setState(() => _currentMinutesValue = value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Alarm'),),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              color: Colors.black.withOpacity(.03),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    minValue: 0,
                    maxValue: 23,
                    value: _currentHourValue,
                    onChanged: (value) {
                      _handleValueChanged(value,"hour");
                    },
                    infiniteLoop: true,
                    textStyle: const TextStyle(fontSize: 30, color: Colors.black38, fontWeight: FontWeight.w400),
                    selectedTextStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                  ),
                  const Text(":",style:TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  NumberPicker(
                    minValue: 0,
                    maxValue: 59,
                    value: _currentMinutesValue,
                    onChanged: (value) {
                      _handleValueChanged(value,"minutes");
                    },
                    infiniteLoop: true,
                    textStyle: const TextStyle(fontSize: 30, color: Colors.black38, fontWeight: FontWeight.w400),
                    selectedTextStyle: const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top:16,left: 16, right:16),
              child: Column(
                children: [
                  TextField(
                    controller: alarmController,
                    decoration: const InputDecoration(
                      labelText: 'Alarm name'
                    ),    
                  ),
                  Container(height:15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Alarm sound",style: TextStyle(fontSize: 16),),
                          Container(height: 4),
                          const Text("Bones",style: TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),),
                        ],
                      ),
                      ),
                      Row(
                        children: [
                          Container(color: Colors.black38,height: 20,width: 1),
                          Switch(value: alarmSound, onChanged: (value){setState((){alarmSound=value;});})
                        ],
                      )
                    ],
                  ),
                  Container(height:1, color: Colors.black12, margin: const EdgeInsets.symmetric(vertical: 8),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Vibration",style: TextStyle(fontSize: 16),),
                          Container(height: 4),
                          const Text("Basic call",style: TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),),
                        ],
                      ),
                      ),
                      Row(
                        children: [
                          Container(color: Colors.black38,height: 20,width: 1),
                          Switch(value: alarmVibrate, onChanged: (value){setState((){alarmVibrate=value;});})
                        ],
                      )
                    ],
                  ),
                  Container(height:1, color: Colors.black12, margin: const EdgeInsets.symmetric(vertical: 8),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Snooze",style: TextStyle(fontSize: 16),),
                          Container(height: 4),
                          const Text("5 minutes, 3 times",style: TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),),
                        ],
                      ),
                      ),
                      Row(
                        children: [
                          Container(color: Colors.black38,height: 20,width: 1),
                          Switch(value: alarmRepeat, onChanged: (value){setState((){alarmRepeat=value;});})
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),        
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,        
        child: Container(
          margin: const EdgeInsets.all(4),
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text('Cancel', style: TextStyle(color: Colors.black87, fontSize: 16))),
              ),
              const Expanded(
                child: TextButton(onPressed: null, child: Text('Create', style: TextStyle(color: Colors.black87, fontSize: 16),)),
              ),              
            ],
          ),
        )
      )
    );
  }
}