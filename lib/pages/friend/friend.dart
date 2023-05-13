import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:bookmeup/db/models/userModel.dart';

import '../../index.dart';

class FriendsBooksWidget extends StatefulWidget {
  const FriendsBooksWidget({Key? key}) : super(key: key);

  @override
  _FriendsBooksWidgetState createState() => _FriendsBooksWidgetState();
}

class _FriendsBooksWidgetState extends State<FriendsBooksWidget> {
  // Dummy data for the user list and book lists
  final List<String> _users = [];
  final Map<String, List<Map<String, String>>> _books = {};
  GeneralController generalController = Get.find();
  String? _selectedUser;

  Future<void> getBooksFromFirestore() async {
    for (FriendModel friend in generalController.friends) {
      print(friend.id);
      final CollectionReference booksCollection = FirebaseFirestore.instance
          .collection(friend.friendid)
          .doc('booksUser')
          .collection('booksUser');
      final QuerySnapshot querySnapshot = await booksCollection.get();
      _users.add(friend.friendid);
      _books[friend.friendid] = [];
      querySnapshot.docs.forEach((doc) async {
        _books[friend.friendid]?.add(
            {'title': doc.get('title'), 'description': doc.get('description')});
      });
      setState(() {});
    }

//adding user
  }

  @override
  void initState() {
    super.initState();
    getBooksFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user),
                  onTap: () {
                    setState(() {
                      _selectedUser = user;
                    });
                  },
                );
              },
            ),
          ),
          if (_selectedUser != null)
            Expanded(
              child: ListView.builder(
                itemCount: _books[_selectedUser]!.length,
                itemBuilder: (context, index) {
                  final book = _books[_selectedUser]![index];
                  return ListTile(
                    title: Text(book['title']!),
                    subtitle: Text(book['description']!),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
