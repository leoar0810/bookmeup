import 'package:bookmeup/index.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:flutter/cupertino.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Book Alarms',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Establecer recordatorios',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20.0),
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
      ),
      bottomNavigationBar: NavigationBarWidget(4),
    );
  }
}
