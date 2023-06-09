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
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    // libros de ejemplo
    books.add(Book(
        title: 'El nombre del viento',
        author: 'Patrick Rothfuss',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0515/0775/7223/products/PorQuienDoblanlasCampanas_227x.jpg?v=1647711358'));
    books.add(Book(
        title: 'El imperio final',
        author: 'Brandon Sanderson',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0515/0775/7223/products/9789585121935_500x.jpg?v=1678145263'));
    books.add(Book(
        title: 'El imperio final',
        author: 'Brandon Sanderson',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0515/0775/7223/products/ElHambre_236x.jpg?v=1642438469'));
    books.add(Book(
        title: 'El imperio final',
        author: 'Brandon Sanderson',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0515/0775/7223/products/9789585549241_229x.jpg?v=1619633988'));
    books.add(Book(
        title: 'El imperio final',
        author: 'Brandon Sanderson',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0515/0775/7223/products/9788418483073_500x.jpg?v=1676158172'));
  }

  void addBook(String title, String author, String imageUrl) {
    setState(() {
      books.add(Book(title: title, author: author, imageUrl: imageUrl));
    });
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
                  Book book = books[index];
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        // Do something when a book is tapped
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
                            book.imageUrl,
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
