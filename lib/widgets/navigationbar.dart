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
      ReadingDashboardWidget(),
      const WelcomePage(),
    ];
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _index,
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
          {Get.to(() => UserList())}
        else if (index == 4)
          {Get.to(() => UserProfileWidget())},
      },
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Image.asset(
              'lib/images/home.png',
              width: 30,
              height: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Image.asset(
              'lib/images/thunder.png',
              width: 30,
              height: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Image.asset(
              'lib/images/add.png',
              width: 50,
              height: 50,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Image.asset(
              'lib/images/friends.png',
              width: 30,
              height: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Image.asset(
              'lib/images/account.png',
              width: 30,
              height: 30,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
