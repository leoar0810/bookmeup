import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, elevation: 0, centerTitle: true),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/backgroundlogin.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                Text('Bookmeup',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 34,
                      fontWeight: FontWeight.normal,
                    )),
                SizedBox(
                  height: 380,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 114, 146, 232),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SignupPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 33,
                      vertical: 16,
                    ),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 211, 222, 252),
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.blueAccent,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
