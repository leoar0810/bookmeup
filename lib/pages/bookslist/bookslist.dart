import 'package:bookmeup/index.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/helpers/book.dart';

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
  GeneralController generalController = Get.find();

  void getstars() async {
    final int numberstars = await generalController.booksUser
        .where((element) => element.bookid == 1)
        .first
        .starts;
    starts = numberstars;
  }

  @override
  Widget build(BuildContext context) {
    getstars();

    return Scaffold(
      body: ListView.builder(
        itemCount: generalController.books.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(generalController.books[index].title),
            subtitle: Text(generalController.books[index].author),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: generalController.books
                      .contains(generalController.books[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        generalController.books
                            .add(generalController.books[index]);
                      } else {
                        generalController.books
                            .remove(generalController.books[index]);
                      }
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      generalController.books
                          .remove(generalController.books[index]);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            onTap: () => Get.to(
              () => BookDetailsWidget(
                bookName: 'The Great Gatsby',
                authorName: 'F. Scott Fitzgerald',
                rating: starts,
                description:
                    'The Great Gatsby is a novel by F. Scott Fitzgerald ...',
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBarWidget(2),
    );
  }
}
