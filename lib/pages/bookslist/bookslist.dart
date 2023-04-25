import 'package:bookmeup/index.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class BookListAddWidget extends StatefulWidget {
  final List<Book> books;
  final List<Book> selectedBooks;

  BookListAddWidget({
    required this.books,
    required this.selectedBooks,
  });

  @override
  _BookListAddWidgetState createState() => _BookListAddWidgetState();
}

class _BookListAddWidgetState extends State<BookListAddWidget> {
  int starts = 0;
  String title = '';
  String author = '';
  String description = '';
  GeneralController generalController = Get.find();

  void getstars() async {
    final int numberstars = await generalController.booksUser
        .where((element) => element.bookid == 1)
        .first
        .starts;
    starts = numberstars;
  }

  void getTitle() async {
    final String _title = await generalController.books
        .where((element) => element.id == 1)
        .first
        .title;
    title = _title;
  }

  void getAuthor() async {
    final String _author = await generalController.books
        .where((element) => element.id == 1)
        .first
        .author;
    author = _author;
  }

  void getDescription() async {
    final String _description = await generalController.books
        .where((element) => element.id == 1)
        .first
        .description;
    description = _description;
  }

  @override
  Widget build(BuildContext context) {
    getstars();
    getTitle();
    getAuthor();
    getDescription();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              Expanded(
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
                        'Book List',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.books.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(widget.books[index].title),
                              subtitle: Text(widget.books[index].author),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: widget.selectedBooks
                                        .contains(widget.books[index]),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value != null && value) {
                                          widget.selectedBooks
                                              .add(widget.books[index]);
                                        } else {
                                          widget.selectedBooks
                                              .remove(widget.books[index]);
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.selectedBooks
                                            .remove(widget.books[index]);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              onTap: () => Get.to(
                                () => BookDetailsWidget(
                                    bookName: title,
                                    authorName: author,
                                    rating: 5,
                                    description: description),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Get.to(() => BookWidget());
                        },
                        child:
                            Text('Do not you find what you are looking for?'),
                      ),
                    ],
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
