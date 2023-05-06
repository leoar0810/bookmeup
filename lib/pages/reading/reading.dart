import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadingStatsWidget extends StatefulWidget {
  ReadingStatsWidget();

  @override
  _ReadingStatsWidget createState() => _ReadingStatsWidget();
}

int _index = 0;

class _ReadingStatsWidget extends State<ReadingStatsWidget> {
  GeneralController generalcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'Bookmeup',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(
                  onPressed: () {
                    print('asdfadskfjsdfjklasd');
                    Get.to(
                      () => ReadingDashboardWidget(
                        booksToRank: [],
                        booksToRead: [],
                        rankedBooks: [],
                        daysOfReading: 1,
                      ),
                    );
                  },
                  color: CupertinoColors.black,
                  child: Text(
                    'Books read this month: ' + '1',
                    style:
                        TextStyle(fontSize: 24, color: CupertinoColors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: generalcontroller.booksUser.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 13.0),
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey2.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            generalcontroller.booksUser[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${generalcontroller.booksUser[index].pages} pages read',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            NavigationBarWidget(0),
          ],
        ),
      ),
    );
  }
}
