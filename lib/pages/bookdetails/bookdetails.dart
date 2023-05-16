import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/index.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsWidget extends StatelessWidget {
  BookDetailsWidget();

  @override
  Widget build(BuildContext context) {
    List<Book> _allBooks = [
      Book('Book 1', 'Author 1'),
      Book('Book 2', 'Author 2'),
      Book('Book 3', 'Author 3'),
      Book('Book 4', 'Author 4'),
    ];

    List<Book> _selectedBooks = [];
    BooksUserModel book = Get.arguments[0];
    GeneralController generalController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color(0xFF5074C3)),
                    ),
                    Text(
                      'Bookmeup',
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                        color: Color(0xFF5074C3),
                        fontSize: 28,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                  child: SizedBox(
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            book.title,
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                              fontSize: 24,
                              letterSpacing: -0.54,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Author:',
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF5074C3),
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                              Row(
                                children: List.generate(
                                  book.starts,
                                  (index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                '${book.author}',
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description:',
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                              color: Color(0xFF5074C3),
                              fontSize: 18,
                              letterSpacing: -0.54,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          SizedBox(height: 8),
                          new SingleChildScrollView(
                              scrollDirection: Axis.vertical, //.horizontal
                              child: new Text(
                                book.description,
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                )),
                              )),
                          Spacer(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Updated
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await generalController.insertBooksUser(book);
                        Get.to(BookListAddWidget(
                            books: _allBooks, selectedBooks: _selectedBooks));
                      },
                      child: Text(
                        'Add to list',
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                          fontSize: 20,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5074C3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(120, 60),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarWidget(2),
    );
  }
}
