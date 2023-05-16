import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../index.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream;
  GeneralController generalController = Get.find();

  @override
  void initState() {
    super.initState();
    // Retrieve the user data from Firestore

    _usersStream =
        FirebaseFirestore.instance.collection('allusers').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd3defc),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add friends',
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                      color: Color(0xFF5074C3),
                      fontSize: 36,
                      letterSpacing: -0.54,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => FriendsBooksWidget());
                    },
                    icon: Icon(
                      Icons.list,
                      color: Color(0xFF5074C3),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _usersStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final users = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        final userData = user.data();

                        // Get the user ID from the document reference
                        final userId = user.reference.id;
                        if (userData['id'] !=
                            FirebaseAuth.instance.currentUser!.uid) {
                          print(userId);
                          print(FirebaseAuth.instance.currentUser!.uid);
                          return ListTile(
                            title: Text(
                              userData['name'],
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: -0.54,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            subtitle: Text(
                              userData['description'],
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                letterSpacing: -0.54,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            onTap: () {
                              FriendModel friend = FriendModel(
                                  id: FirebaseAuth.instance.currentUser!.uid,
                                  friendid: userData['id']);
                              generalController.insertFriend(friend);
                              print(userId);
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarWidget(3),
    );
  }
}
