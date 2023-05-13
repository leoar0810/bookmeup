import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> _createUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User ${userCredential.user!.uid} created');
      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          name: nameController.text,
          username: emailController.text,
          password: passwordController.text,
          description: descriptionController.text);
      GeneralController generalController = Get.find();
      generalController.insertUser(userModel);
      void copyInfoToFireStore(
          Map<String, dynamic> dataList, String user) async {
        // get a reference to the Firestore collection
        CollectionReference collectionRef =
            FirebaseFirestore.instance.collection(user);

        // iterate through the list and add each item to Firestore

        await collectionRef.add(dataList);
      }

      copyInfoToFireStore({
        'id': userCredential.user!.uid,
        'name': nameController.text,
        'description': descriptionController.text
      }, 'allusers');

      copyInfoToFireStore(userModel.toMap(), userCredential.user!.uid);
      void _signOut() async {
        await FirebaseAuth.instance.signOut();
      }

      _signOut();
      Get.to(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/backgroundsignup.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 145),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  SizedBox(height: 100),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 61, 109, 180)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 61, 109, 180)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 61, 109, 180)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 61, 109, 180)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _createUser(context),
                    child: Text('Sign Up'),
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
                    onPressed: () => Get.to(() => LoginPage()),
                    child: Text('Already have an account? Log in',
                        style: TextStyle(color: Colors.white)),
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
