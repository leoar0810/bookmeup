import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/widgets/navigationbar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bookmeup/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/datasources/local/local_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late String _username = '';
  late String _description = '';
  late String _photoUrl = '';
  GeneralController generalController = Get.find();
  String name = '';
  String description = '';
  @override
  void initState() {
    super.initState();
    // Load user data from database
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Load user data from SQFlite database
    // ...
    final CollectionReference booksCollection1 = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid);

    final QuerySnapshot querySnapshot1 = await booksCollection1.get();

    querySnapshot1.docs.forEach((doc) async {
      name = doc.get('name');
      description = doc.get('description');
    });
    setState(() {
      // Set the state of the widget with the loaded data
      _username = name;
      _description = description;
      _photoUrl =
          "https://this-person-does-not-exist.com/img/avatar-gen11b4cc74f765e731cb1bbd603713094c.jpg";
    });
  }

  void _signOut() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final List<Future<void>> futures = [];

    querySnapshot.docs.forEach((doc) {
      futures.add(doc.reference.delete());
    });
    await Future.wait(futures);

    final QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('booksUser')
        .collection('booksUser')
        .get();
    final List<Future<void>> futures2 = [];

    querySnapshot1.docs.forEach((doc) {
      futures2.add(doc.reference.delete());
    });
    await Future.wait(futures2);

    final QuerySnapshot querySnapshot3 = await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('alarms')
        .collection('alarms')
        .get();
    final List<Future<void>> futures3 = [];

    querySnapshot3.docs.forEach((doc) {
      futures3.add(doc.reference.delete());
    });
    await Future.wait(futures3);

    final QuerySnapshot querySnapshot4 = await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('friends')
        .collection('friends')
        .get();
    final List<Future<void>> futures4 = [];

    querySnapshot4.docs.forEach((doc) {
      futures4.add(doc.reference.delete());
    });
    await Future.wait(futures4);

    await FirebaseAuth.instance.signOut();

    await generalController.uploadData();
    await generalController.deleteall();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getBooksFromFirestore() async {
      final CollectionReference booksCollection1 = FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser!.uid);

      final QuerySnapshot querySnapshot1 = await booksCollection1.get();

      querySnapshot1.docs.forEach((doc) async {
        name = doc.get('name');
        description = doc.get('description');
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Bookmeup',
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
            color: Color(0xFF5074C3),
            fontSize: 30,
            letterSpacing: -0.54,
            fontWeight: FontWeight.bold,
          )),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _signOut();
              Get.to(() => WelcomePage());
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0xFF5074C3),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFD3DEFC),
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(_photoUrl),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _username,
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                          color: Color(0xFF5074C3),
                          fontSize: 25,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _description,
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: -0.54,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(Icons.track_changes, 'Tracker',
                            () => Get.to(() => ReadingDashboardWidget())),
                        _buildIconButton(Icons.access_alarm, 'Alarm',
                            () => Get.to(MyAlarmW())),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarWidget(4),
    );
  }

  Widget _buildIconButton(
      IconData iconData, String text, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            onPressed();
          },
          icon: Icon(
            iconData,
            size: 30,
            color: Color(0xFF5074C3),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
            color: Color(0xFF5074C3),
            fontSize: 14,
            letterSpacing: -0.54,
            fontWeight: FontWeight.bold,
          )),
        ),
      ],
    );
  }
}
