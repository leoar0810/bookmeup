import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:bookmeup/datasources/remote/bookremoteapi.dart';

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
  GeneralController generalController = Get.find();

  late Future<List<dynamic>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
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
                        child: FutureBuilder<List<dynamic>>(
                          future: futureBooks,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  final book =
                                      snapshot.data![index]['volumeInfo'];
                                  final title = book['title'];
                                  String author = '';
                                  if (book['authors'] == null) {
                                    author = 'Unknown author';
                                  } else {
                                    author = book['authors'][0];
                                  }

                                  final pageCount = book['pageCount'] ??
                                      'Unknown number of pages';
                                  String description = book['description'] ??
                                      'No description available';
                                  if (description.length > 200) {
                                    description = description.substring(0, 200);
                                  }
                                  return ListTile(
                                    title: Text(title),
                                    subtitle:
                                        Text('$author | $pageCount pages'),
                                    trailing: Icon(Icons.arrow_forward),
                                    onTap: () async {
                                      BooksUserModel bookuser = BooksUserModel(
                                        id: 1,
                                        userid: 1,
                                        bookid: 1,
                                        starts: 0,
                                        pages: book['pageCount'] as int,
                                        toread: 1,
                                        status: 1,
                                        title: book['title'],
                                        author: book['authors'][0] ??
                                            'Unknown author',
                                        ISBN: 'asdf',
                                        description: description,
                                        cover: book['imageLinks']
                                                ['thumbnail'] ??
                                            'https://img.freepik.com/premium-vector/white-blank-book-cover-isolated-grey-background-realistic-closed-vertical-book-magazine-notebook-template-your-design-front-side-book_168129-357.jpg',
                                        pagesreaded: 0,
                                      );
                                      Get.to(BookDetailsWidget(),
                                          arguments: [bookuser]);
                                    },
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Get.to(() => BookWidget(), arguments: []);
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
