import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FriendsBooksWidget extends StatefulWidget {
  @override
  _FriendsBooksWidgetState createState() => _FriendsBooksWidgetState();
}

class _FriendsBooksWidgetState extends State<FriendsBooksWidget> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final friends = data.map((e) => Friend.fromJson(e)).toList();

      setState(() {
        _friends = friends;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends Books'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_friends.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: _friends.length,
      itemBuilder: (context, index) {
        final friend = _friends[index];

        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFriendHeader(friend),
              Divider(),
              _buildBooksList(friend),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFriendHeader(Friend friend) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatarUrl),
      ),
      title: Text(friend.name),
    );
  }

  Widget _buildBooksList(Friend friend) {
    if (friend.books.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Books (${friend.books.length})',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: friend.books.length,
            itemBuilder: (context, index) {
              final book = friend.books[index];

              return Container(
                width: 180,
                margin: const EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBookImage(book),
                      _buildBookInfo(book),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookImage(Book book) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Image.network(
        book.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBookInfo(Book book) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          _buildStarRating(book.rating),
          SizedBox(height: 8),
          Text(
            book.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    final stars = List.generate(
      rating,
      (index) => Icon(
        Icons.star,
        color: Colors.yellow[700],
      ),
    );
    return Row(children: stars);
  }
}

class Friend {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String avatarUrl;
  final List<Book> books;

  Friend({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.books,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    final booksData = json['books'] as List<dynamic>;
    final books = booksData.map((e) => Book.fromJson(e)).toList();
    return Friend(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      avatarUrl: 'https://picsum.photos/seed/${json['id']}/80',
      books: books,
    );
  }
}

class Book {
  final String title;
  final int rating;
  final String imageUrl;
  final String description;

  Book({
    required this.title,
    required this.rating,
    required this.imageUrl,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      rating: json['rating'] as int,
      imageUrl: 'https://picsum.photos/seed/${json['id']}/240/180',
      description: json['description'] as String,
    );
  }
}
