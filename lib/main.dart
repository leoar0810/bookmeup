import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/controllers/generalcontroller.dart';

final db = SqliteService();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(GeneralController());
  db.initializeDB();
  runApp(GetMaterialApp(
    title: 'BookmeUP',
    initialRoute: '/',
    routes: {'/': (context) => CheckAuthScreen()},
  ));
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class CheckAuthScreen extends StatefulWidget {
  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      checkUser();
    });
  }

  void checkUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      Get.to(() => ReadingStatsWidget(
            booksReadInMonth: 3,
            booksRead: [
              {'title': 'To Kill a Mockingbird', 'pagesRead': 150},
              {'title': '1984', 'pagesRead': 200},
              {'title': 'The Catcher in the Rye', 'pagesRead': 100},
            ],
          ));
    } else {
      Get.to(() => WelcomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
