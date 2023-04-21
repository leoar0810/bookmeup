import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookmeUP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SignupPage());
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
