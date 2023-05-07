import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:bookmeup/datasources/remote/bookremoteapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
  final _searchController = TextEditingController();

  Future<List<dynamic>> fetchBooks(String searchQuery) async {
    var response;
    if (searchQuery.isEmpty) {
      response = await http.get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=inauthor&orderBy=relevance&maxResults=20'));
    } else {
      response = await http.get(Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=$searchQuery'));
    }

    if (response.statusCode == 200) {
      return json.decode(response.body)['items'].take(100).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  late Future<List<dynamic>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks('');
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
              Row(
                children: [
                  Icon(Icons.search),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for a book',
                      ),
                      onChanged: (query) {
                        setState(() {
                          futureBooks = fetchBooks(query);
                        });
                      },
                    ),
                  ),
                ],
              ),
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
                                      final prefs =
                                          await SharedPreferences.getInstance();

                                      BooksUserModel bookuser = BooksUserModel(
                                        id: 1,
                                        userid: prefs.getString('user') ?? '',
                                        bookid: 1,
                                        starts: 0,
                                        pages: book['pageCount'] as int,
                                        toread: 1,
                                        status: 1,
                                        title: book['title'],
                                        author: author,
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
