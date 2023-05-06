import 'package:flutter/material.dart';
import 'package:bookmeup/datasources/remote/bookremoteapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book List'),
        ),
        body: BookList(),
      ),
    );
  }
}

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  late Future<List<dynamic>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: futureBooks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final book = snapshot.data![index]['volumeInfo'];
              final title = book['title'];
              final author = book['authors']?.join(', ') ?? 'Unknown author';
              final pageCount = book['pageCount'] ?? 'Unknown number of pages';
              final description =
                  book['description'] ?? 'No description available';
              return ListTile(
                title: Text(title),
                subtitle: Text('$author | $pageCount pages'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // TODO: Navigate to book detail page
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
    );
  }
}
