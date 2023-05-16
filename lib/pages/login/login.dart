import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/pages/friend/friend.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GeneralController generalController = Get.find();

  Future<void> _loginUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User ${userCredential.user!.uid} logged in');
      final prefs = await SharedPreferences.getInstance();
      generalController.initController();
      await prefs.setString('user', userCredential.user!.uid);
      await generalController.getBooksFromFirestore();
      generalController.initController();
      Get.to(() => ReadingStatsWidget());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'User d',
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                letterSpacing: -0.54,
                fontWeight: FontWeight.bold,
              )),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF5074C3),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'wrong password provided for that user',
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                letterSpacing: -0.54,
                fontWeight: FontWeight.bold,
              )),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF5074C3),
          ),
        );
      } else {
        print(e.code);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Something went wrong',
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                letterSpacing: -0.54,
                fontWeight: FontWeight.bold,
              )),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF5074C3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/backgroundlogin.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                  SizedBox(height: 150),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xffC9CCCF)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffC9CCCF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffC9CCCF)),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffC9CCCF),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xffC9CCCF)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffC9CCCF)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffC9CCCF)),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _loginUser(context),
                    child: Text('Log in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 114, 146, 232),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () => Get.to(() => SignupPage()),
                    child: Text(
                      'Don\'t have an account? Sign up',
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 146, 232),
                        fontSize: 15,
                        letterSpacing: -0.54,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
