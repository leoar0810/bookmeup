import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookAlarmItem extends StatefulWidget {
  final String alarmTime;
  final bool isAlarmOn;

  const BookAlarmItem(
      {Key? key, required this.alarmTime, required this.isAlarmOn})
      : super(key: key);

  @override
  _BookAlarmItemState createState() => _BookAlarmItemState();
}

class _BookAlarmItemState extends State<BookAlarmItem> {
  bool isAlarmOn = false;

  @override
  void initState() {
    super.initState();
    isAlarmOn = widget.isAlarmOn;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          widget.alarmTime,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        trailing: CupertinoSwitch(
          value: isAlarmOn,
          onChanged: (newValue) {
            setState(() {
              isAlarmOn = newValue;
            });
          },
        ),
      ),
    );
  }
}

class BookAlarmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Alarms'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 16.0),
              Text(
                'Establecer recordatorios',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
              const SizedBox(width: 16.0),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return BookAlarmItem(alarmTime: '8:00 AM', isAlarmOn: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
