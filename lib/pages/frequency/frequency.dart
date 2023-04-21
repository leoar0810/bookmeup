import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/widgets/navigationbar.dart';

class FrequencyStatsWidget extends StatelessWidget {
  final int lectureTime;
  final int pagesRead;
  final int continuousDaysReading;
  final List<int> minutesReadingByDayOfWeek;

  FrequencyStatsWidget({
    required this.lectureTime,
    required this.pagesRead,
    required this.continuousDaysReading,
    required this.minutesReadingByDayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Lecture time: $lectureTime'),
              Text('Pages read: $pagesRead'),
              Text('Continuous days reading: $continuousDaysReading'),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            height: 200.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar(0, minutesReadingByDayOfWeek),
                _buildBar(1, minutesReadingByDayOfWeek),
                _buildBar(2, minutesReadingByDayOfWeek),
                _buildBar(3, minutesReadingByDayOfWeek),
                _buildBar(4, minutesReadingByDayOfWeek),
                _buildBar(5, minutesReadingByDayOfWeek),
                _buildBar(6, minutesReadingByDayOfWeek),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Mon'),
              Text('Tue'),
              Text('Wed'),
              Text('Thu'),
              Text('Fri'),
              Text('Sat'),
              Text('Sun'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(4),
    ));
  }

  Widget _buildBar(int index, List<int> minutesReadingByDayOfWeek) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: minutesReadingByDayOfWeek[index].toDouble(),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
