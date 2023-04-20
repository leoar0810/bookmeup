import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookmeup/index.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({Key? key}) : super(key: key);

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book List'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _signOut();
                  Get.to(() => WelcomePage());
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ));
  }
}
