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
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(widget.alarmTime),
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
        title: Text('Book Alarms'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 16.0),
              Text(
                'Establecer recordatorios',
                style: TextStyle(fontSize: 20.0),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              SizedBox(width: 16.0),
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
