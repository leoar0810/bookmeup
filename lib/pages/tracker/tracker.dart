import 'package:flutter/material.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:bookmeup/index.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingDashboardWidget extends StatelessWidget {
  GeneralController generalController = Get.find();

  ReadingDashboardWidget();

  @override
  Widget build(BuildContext context) {
    final pagesReaded = Get.arguments[0];
    final booksReaded = Get.arguments[1];
    final rankedBooks = Get.arguments[2];
    final booksToRead = Get.arguments[3];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF5074C3),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Bookmeup',
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
            fontSize: 30,
            color: Color(0xFF5074C3),
            letterSpacing: -0.54,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pages in reading',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: -0.54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pagesReaded.toString(),
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Number of books to read',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    booksToRead.toString(),
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10, bottom: 50, top: 50),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[50],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'books in reading',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              booksReaded.toString(),
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 50, top: 50),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple[50],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'books ranked',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              rankedBooks.toString(),
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.purple,
                                  letterSpacing: -0.54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarWidget(1),
    );
  }
}
