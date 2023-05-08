import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingStatsWidget extends StatefulWidget {
  ReadingStatsWidget();

  @override
  _ReadingStatsWidget createState() => _ReadingStatsWidget();
}

int _index = 0;

class _ReadingStatsWidget extends State<ReadingStatsWidget> {
  GeneralController generalcontroller = Get.find();
  List<BooksUserModel> books = [];
  List<Person> people = [];
  @override
  void initState() {
    super.initState();
    books = generalcontroller.booksUser;
    people.add(Person(
        name: 'Juan',
        imageUrl:
            'https://this-person-does-not-exist.com/img/avatar-gen11b4cc74f765e731cb1bbd603713094c.jpg'));
    people.add(Person(
        name: 'David',
        imageUrl:
            'https://this-person-does-not-exist.com/img/avatar-gen116813ffdcd572489c515494a5b1296f.jpg'));
    people.add(Person(
        name: 'Julio',
        imageUrl:
            'https://this-person-does-not-exist.com/img/avatar-gen111eea15bbf14f3eb8472c089323f21c.jpg'));
  }

  int pagesReaded = 0;
  int booksReaded = 0;
  int rankedBooks = 0;
  int booksToRead = 0;
  int percentage = 0;

  void calculatePagesReaded() {
    int pagesReaded1 = 0;
    int booksReaded1 = 0;
    int rankedBooks1 = 0;
    int booksToRead1 = 0;
    for (var book in generalcontroller.booksUser) {
      if (true) {
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

    if (booksReaded != 0) {
      percentage = ((booksReaded / (booksReaded + booksToRead)) * 100).round();
    } else {
      percentage = 0;
    }
  }

  void addPerson(String name, String imageUrl) {
    setState(() {
      people.add(Person(name: name, imageUrl: imageUrl));
    });
  }

  @override
  Widget build(BuildContext context) {
    calculatePagesReaded();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'BookmeUp',
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                    color: Color(0xFF7292E8),
                    fontSize: 36,
                    letterSpacing: -0.54,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('asdfadskfjsdfjklasd');
                    Get.to(
                      ReadingDashboardWidget(),
                      arguments: [
                        pagesReaded,
                        booksReaded,
                        rankedBooks,
                        booksToRead
                      ],
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFD3DEFC)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 0.0, bottom: 10.0),
                          child: Text(
                            'Congratulations!',
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                              color: Color(0xFF5074C3),
                              fontSize: 26,
                              letterSpacing: -0.54,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                        ),
                        Container(
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFFf6f8fe),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            clipBehavior: Clip
                                .antiAliasWithSaveLayer, // agregar anti-aliasing
                            child: LinearProgressIndicator(
                              value: percentage /
                                  100, // Aquí iría el porcentaje de progreso
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF9CB5F7)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$booksReaded of ${booksToRead + booksReaded}',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        color: Color(0xFF123A93),
                                        fontSize: 25,
                                        letterSpacing: -0.54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${percentage} %', // Aquí iría el porcentaje de progreso
                                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                        color: Color(0xFF3E578E),
                                        fontSize: 32,
                                        letterSpacing: -0.54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'books read',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        color: Color(0xFF123A93),
                                        fontSize: 18,
                                        letterSpacing: -0.54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 0.0, left: 20, bottom: 5, right: 20),
              child: Align(
                child: Row(
                  children: [
                    Text(
                      'Your books',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        color: Color(0xFF394970),
                        fontSize: 17,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    Spacer(),
                    Text(
                      'See more >',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.0),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(19.0),
                    bottomRight: Radius.zero,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFD3DEFC),
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 0.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    itemBuilder: (BuildContext context, int index) {
                      BooksUserModel book = books[index];
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Get.to(BookWidget(), arguments: [book]);
                          },
                          child: Stack(
                            children: [
                              Container(
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
                              Positioned(
                                right: 15,
                                bottom: 0,
                                child: Container(
                                  width: 70,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    clipBehavior: Clip
                                        .antiAliasWithSaveLayer, // agregar anti-aliasing
                                    child: LinearProgressIndicator(
                                      value: book.pagesreaded /
                                          book.pages, // Aquí iría el porcentaje de progreso
                                      backgroundColor: Colors.transparent,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xFF6283CE)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 0.0, left: 20, bottom: 5, right: 20),
              child: Align(
                child: Row(
                  children: [
                    Text(
                      'Your friends',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        color: Color(0xFF394970),
                        fontSize: 17,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    Spacer(),
                    Text(
                      'See more >',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.0),
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFD3DEFC),
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0, right: 0.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: people.length,
                    itemBuilder: (BuildContext context, int index2) {
                      Person person = people[index2];
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            // Do something when a person is tapped
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                person.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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

class Person {
  String name;
  String imageUrl;

  Person({required this.name, required this.imageUrl});
}
