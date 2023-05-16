import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:bookmeup/index.dart';
import 'package:google_fonts/google_fonts.dart';

class BookWidget extends StatefulWidget {
  const BookWidget({Key? key}) : super(key: key);

  @override
  _BookWidgetState createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  GeneralController generalController = Get.find();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _ratingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.find();
    var data = Get.arguments[0];
    _ratingController.text = data.pagesreaded.toString();
    _descriptionController.text = data.description;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                data.title,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                  color: Color(0xFF5074C3),
                  fontSize: 28,
                  letterSpacing: -0.54,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(height: 10),
              Text(
                'by ${data.author}',
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  letterSpacing: -0.54,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(
                  hintText: 'Enter pages readed',
                  hintStyle: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.54,
                    fontWeight: FontWeight.bold,
                  )),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter book description',
                  hintStyle: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.54,
                    fontWeight: FontWeight.bold,
                  )),
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  print('asdf' + data.id.toString());
                  BooksUserModel book = data;
                  book.id = data.id;
                  book.pagesreaded = int.parse(_ratingController.text);
                  book.description = _descriptionController.text;
                  await generalController.updateBooksUser(book);
                  Get.to(ReadingStatsWidget());
                },
                child: Text(
                  'Update Book',
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
                  minimumSize: Size(double.infinity, 60),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.to(
                      RankbookScreen(
                        imageUrl:
                            'https://i.pinimg.com/originals/34/6a/1f/346a1f4363e1b59f6860fdce6abc1082.jpg',
                      ),
                      arguments: [data]);
                },
                child: Text(
                  'Already read this book? Rank it!',
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    letterSpacing: -0.54,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarWidget(2),
    );
  }
}
