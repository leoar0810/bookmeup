import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';

class ReadingDashboardWidget extends StatelessWidget {
  final miController = GeneralController.to;
  final int daysOfReading;
  final List<String> rankedBooks;
  final List<String> booksToRead;
  final List<String> booksToRank;

  ReadingDashboardWidget({
    required this.daysOfReading,
    required this.rankedBooks,
    required this.booksToRead,
    required this.booksToRank,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ReadingStatsWidget(
        booksReadInMonth: 3,
        booksRead: const [
          {'title': 'To Kill a Mockingbird', 'pagesRead': 150},
          {'title': '1984', 'pagesRead': 200},
          {'title': 'The Catcher in the Rye', 'pagesRead': 100},
        ],
      ),
      ReadingDashboardWidget(
        booksToRank: [],
        booksToRead: [],
        rankedBooks: [],
        daysOfReading: 1,
      ),
      const WelcomePage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Days of Reading',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '$daysOfReading',
                    style: TextStyle(fontSize: 36.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Ranked Books',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: rankedBooks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(rankedBooks[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Books to Read',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '${booksToRead.length}',
                          style: TextStyle(fontSize: 36.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Books to Rank',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '${booksToRank.length}',
                          style: TextStyle(fontSize: 36.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300.0,
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: IconButton(
                onPressed: () => {
                      Get.to(() => FrequencyStatsWidget(
                            lectureTime: 120,
                            pagesRead: 50,
                            continuousDaysReading: 7,
                            minutesReadingByDayOfWeek: [
                              30,
                              40,
                              20,
                              50,
                              60,
                              45,
                              35
                            ],
                          ))
                    },
                icon: Icon(Icons.add)),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(1),
    );
  }
}
