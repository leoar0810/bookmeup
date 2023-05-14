import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import '../index.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAlarmW extends StatefulWidget {
  const MyAlarmW({Key? key}) : super(key: key);

  @override
  State<MyAlarmW> createState() => _MyAlarmWState();
}

class _MyAlarmWState extends State<MyAlarmW> {
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF5074C3),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'https://media.istockphoto.com/id/1181695663/vector/clock-alarm-icon-vector-sign-isolated-on-white.jpg?s=612x612&w=0&k=20&c=LLGMhYDDO691IJSNoArff1Zp6YrC5GHkZsYO9x2aB8c=',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xffd3defc),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Time for a new alarm?',
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                            color: Color(0xFF5074C3),
                            fontSize: 22,
                            letterSpacing: -0.54,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          controller: _timeController,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Alarm time',
                            labelStyle: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                              color: Color(0xFF5074C3),
                              fontSize: 18,
                              letterSpacing: -0.54,
                              fontWeight: FontWeight.w600,
                            )),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.access_time,
                                  color: Color(0xff5074c3)),
                              onPressed: () {
                                _selectTime(context);
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Container(
                            constraints:
                                BoxConstraints.tightFor(width: 200, height: 50),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                final String time = _timeController.text;
                                final int hour = int.parse(time.split(':')[0]);
                                final int minute = int.parse(
                                    time.split(':')[1].substring(0, 2));
                                final String period =
                                    time.split(':')[1].substring(3);

                                // Convert the hour to 24h format
                                int hour24 = hour;
                                if (period == 'PM' && hour != 12) {
                                  hour24 = hour + 12;
                                } else if (period == 'AM' && hour == 12) {
                                  hour24 = 0;
                                }

                                FlutterAlarmClock.createAlarm(hour24, minute);
                                //redirect to previous page after two seconds
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                'Create alarm',
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                  color: Color(0xFF5074C3),
                                  fontSize: 18,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(vertical: 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
