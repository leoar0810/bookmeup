import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class MyAlarmW extends StatefulWidget {
  const MyAlarmW({Key? key}) : super(key: key);

  @override
  State<MyAlarmW> createState() => _MyAlarmWState();
}

class _MyAlarmWState extends State<MyAlarmW> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter alarm clock example'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Create alarm at 23:59',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.createAlarm(9, 59);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Show alarms',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.showAlarms();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Create timer for 42 seconds',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.createTimer(42);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Show Timers',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.showTimers();
              },
            ),
          ),
        ])),
      ),
    );
  }
}
