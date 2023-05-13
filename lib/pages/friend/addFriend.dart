import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream;
  GeneralController generalController = Get.find();

  void getRootsCollections() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collectionGroup("").get();
  }

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Add friends',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => FriendsBooksWidget());
            },
            icon: Icon(
              Icons.list,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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

              return ListTile(
                title: Text(userData['name']),
                subtitle: Text(userData['description']),
                onTap: () {
                  FriendModel friend = FriendModel(
                      id: FirebaseAuth.instance.currentUser!.uid,
                      friendid: userData['id']);
                  generalController.insertFriend(friend);
                  print(userId);
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: NavigationBarWidget(3),
    );
  }
}
