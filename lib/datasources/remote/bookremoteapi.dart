import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchBooks() async {
  final response = await http
      .get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=inauthor'));

  if (response.statusCode == 200) {
    return json.decode(response.body)['items'].take(40).toList();
  } else {
    throw Exception('Failed to load books');
  }
}
