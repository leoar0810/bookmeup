import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/pages/showremote.dart';
import 'package:bookmeup/pages/showremote.dart';

class NavigationBarWidget extends StatelessWidget {
  final int _index;
  NavigationBarWidget(this._index);

  @override
  Widget build(BuildContext context) {
    List<Book> _allBooks = [
      Book('Book 1', 'Author 1'),
      Book('Book 2', 'Author 2'),
      Book('Book 3', 'Author 3'),
      Book('Book 4', 'Author 4'),
    ];
    List<Book> _selectedBooks = [];

    final List<Widget> _pages = [
      ReadingStatsWidget(),
      ReadingDashboardWidget(
        booksToRank: [],
        booksToRead: [],
        rankedBooks: [],
        daysOfReading: 1,
      ),
      const WelcomePage(),
    ];
    return BottomNavigationBar(
      currentIndex: _index,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      showUnselectedLabels: true,
      onTap: (int index) => {
        print(index),
        if (index == 0)
          {Get.to(() => ReadingStatsWidget())}
        else if (index == 1)
          {Get.to(() => TrendingWidget())}
        else if (index == 2)
          {
            Get.to(
              () => BookListAddWidget(
                  books: _allBooks, selectedBooks: _selectedBooks),
            )
          }
        else if (index == 3)
          {Get.to(() => MyApp())}
        else if (index == 4)
          {Get.to(() => UserProfileWidget())},
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: 'Trending',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Friends',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
