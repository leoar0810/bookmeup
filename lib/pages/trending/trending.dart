import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1519307212971-dd9561667ffb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFyZWphJTIwZW4lMjBsYSUyMHBsYXlhfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      'Tendency',
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF6283CE).withOpacity(0.75),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 90,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'FEATURED',
                        style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                          color: Color(0xFFA0B9DD),
                          fontSize: 17,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'For those \nwho love romance',
                        style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 30.0, left: 20, bottom: 10, right: 20),
              child: Align(
                child: Row(
                  children: [
                    Text(
                      'For you',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          color: Color(0xFF123A93),
                          fontSize: 17,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See more',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        itemBuilder: (BuildContext context, int index) {
                          Book book = books[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 15),
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
                  ),
                ],
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
