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
  int pagesReaded = 0;
  int booksReaded = 0;
  int rankedBooks = 0;
  int booksToRead = 0;

  void calculatePagesReaded() {
    int pagesReaded1 = 0;
    int booksReaded1 = 0;
    int rankedBooks1 = 0;
    int booksToRead1 = 0;
    for (var book in generalcontroller.booksUser) {
      if (book.userid == 1) {
        if (book.pagesreaded != 0) {
          pagesReaded1 += book.pagesreaded;
          booksReaded1 += 1;
        } else {
          booksToRead1 += 1;
        }
        if (book.starts != 0) {
          rankedBooks1 += 1;
        }
      }
    }
    pagesReaded = pagesReaded1;
    booksReaded = booksReaded1;
    rankedBooks = rankedBooks1;
    booksToRead = booksToRead1;
  }

  @override
  Widget build(BuildContext context) {
    calculatePagesReaded();
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
                      ReadingDashboardWidget(booksToRank: [], booksToRead: [], daysOfReading: 0, rankedBooks: [],),
                      arguments: [
                        pagesReaded,
                        booksReaded,
                        rankedBooks,
                        booksToRead
                      ],
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
                    return GestureDetector(
                        onTap: () async {
                          print(generalcontroller.booksUser[index].id);
                          Get.to(BookWidget(),
                              arguments: [generalcontroller.booksUser[index]]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 13.0),
                          padding: const EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey2
                                    .withOpacity(0.5),
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
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ));
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
