import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:bookmeup/index.dart';

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
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'by ${data.author}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(
                  hintText: 'Enter pages readed',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter book description',
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
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
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
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
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
