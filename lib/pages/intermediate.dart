import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:bookmeup/controllers/readingcontroller.dart';

class Intermediate extends StatefulWidget {
  @override
  _IntermediateState createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      Get.to(ReadingStatsWidget());
    });
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
