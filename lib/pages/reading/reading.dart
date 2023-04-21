import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/widgets/navigationbar.dart';

class ReadingStatsWidget extends StatefulWidget {
  final int booksReadInMonth;
  final List<Map<String, dynamic>> booksRead;

  ReadingStatsWidget({required this.booksReadInMonth, required this.booksRead});
  @override
  _ReadingStatsWidget createState() => _ReadingStatsWidget();
}

int _index = 0;

class _ReadingStatsWidget extends State<ReadingStatsWidget> {
  List<Book> _allBooks = [
    Book('Book 1', 'Author 1'),
    Book('Book 2', 'Author 2'),
    Book('Book 3', 'Author 3'),
    Book('Book 4', 'Author 4'),
  ];
  List<Book> _selectedBooks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: FloatingActionButton.extended(
              label: Text(
                'Books read this month: ' + widget.booksReadInMonth.toString(),
                style: TextStyle(fontSize: 24),
              ), // <-- Text
              backgroundColor: Colors.black,
              icon: Icon(
                // <-- Icon
                Icons.download,
                size: 24.0,
              ),
              onPressed: () {
                print('asdfadskfjsdfjklasd');
                Get.to(() => ReadingDashboardWidget(
                      booksToRank: [],
                      booksToRead: [],
                      rankedBooks: [],
                      daysOfReading: 1,
                    ));
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.booksRead.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.booksRead[index]['title']),
                  subtitle: Text(
                      '${widget.booksRead[index]['pagesRead']} pages read'),
                );
              },
            ),
          ),
          //NavigationBar1(),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(0),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
