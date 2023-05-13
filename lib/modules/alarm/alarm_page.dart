import 'package:alarm_clock/app_bottom_bar.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  List<String> pages = ["Alarm","Stopwatch","Timer"];
  int actualPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm',textDirection: TextDirection.ltr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '/alarm-new');
                }, icon: const Icon(Icons.add)),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const AppBottomBar()
    );
  }
}