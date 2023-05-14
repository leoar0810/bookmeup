import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:google_fonts/google_fonts.dart';

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
      print(friend.friendid);
      final CollectionReference booksCollection = FirebaseFirestore.instance
          .collection(friend.friendid)
          .doc('booksUser')
          .collection('booksUser');
      final QuerySnapshot querySnapshot = await booksCollection.get();

      final CollectionReference booksCollection1 =
          FirebaseFirestore.instance.collection(friend.friendid);

      final QuerySnapshot querySnapshot1 = await booksCollection1.get();

      querySnapshot1.docs.forEach((doc) async {
        UserModel userm = UserModel(
          id: doc.get('id'),
          name: doc.get('name'),
          username: doc.get('username'),
          password: doc.get('password'),
          description: doc.get('description'),
        );

        _users.add(userm.name);
        print('sdifjklsdfklasjdklfjsdkljflsdjfjsdjkfsdfjklf');
        _books[userm.name] = [];
        querySnapshot.docs.forEach((doc) async {
          _books[userm.name]?.add({
            'title': doc.get('title'),
            'description': doc.get('description')
          });
        });
        setState(() {});
      });
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
        title: Text(
          'User List',
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
            color: Color(0xFF5074C3),
            fontSize: 25,
            letterSpacing: -0.54,
            fontWeight: FontWeight.bold,
          )),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF5074C3),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color(0xFFd3defc),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(
                    user,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                      color: Color(0xFF5074C3),
                      fontSize: 20,
                      letterSpacing: -0.54,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
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
                    title: Text(
                      book['title']!,
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    subtitle: Text(
                      book['description']!,
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(3),
    );
  }
}
