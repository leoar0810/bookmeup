import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/widgets/navigationbar.dart';

class TrendingWidget extends StatefulWidget {
  @override
  _TrendingWidget createState() => _TrendingWidget();
}

int _index = 0;

class _TrendingWidget extends State<TrendingWidget> {
  List<BooksUserModel> books = [];

  GeneralController generalController = Get.find();

  @override
  void initState() {
    super.initState();
    // libros de ejemplo
    int tam = 0;
    if (generalController.booksUser.length > 5) {
      tam = 5;
    } else {
      tam = generalController.booksUser.length;
    }

    List<BooksUserModel> getTopRatedBooks(List<BooksUserModel> books) {
      books.sort((a, b) => b.starts.compareTo(
          a.starts)); // sort books by star rating in descending order
      return books
          .take(tam)
          .toList(); // get the first 5 books from the sorted list
    }

    books = getTopRatedBooks(generalController.booksUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tendencias',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'DESTACADOS',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Para los que aman el amor',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(
                  onPressed: () {},
                  color: CupertinoColors.black,
                  child: Text(
                    'Trending',
                    style:
                        TextStyle(fontSize: 24, color: CupertinoColors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  BooksUserModel book = books[index];
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        Get.to(BookDetailsWidget(), arguments: [book]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            book.cover,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            NavigationBarWidget(1),
          ],
        ),
      ),
    );
  }
}

class Book {
  String title;
  String author;
  String imageUrl;

  Book({required this.title, required this.author, required this.imageUrl});
}
