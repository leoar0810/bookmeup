import 'package:bookmeup/index.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bookmeup/widgets/navigationbar.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late String _username;
  late String _description;
  late String _photoUrl;

  @override
  void initState() {
    super.initState();
    // Load user data from database
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Load user data from SQFlite database
    // ...

    setState(() {
      // Set the state of the widget with the loaded data
      _username = "John Doe";
      _description = "This is my description";
      _photoUrl =
          "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // User photo
          Image.network(_photoUrl),
          // User name and description
          Text(_username),
          Text(_description),
          // Buttons
          Row(
            children: [
              // Marks button
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.star_border),
              ),
              // Tracker button
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.track_changes),
              ),
              // Highlight button
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.highlight),
              ),
              // Favorites button
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
              // Notes button
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notes),
              ),
              // Configuration button
              IconButton(
                onPressed: () {
                  Get.to(() => BookAlarmsScreen());
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(4),
    );
  }
}
