import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/helpers/book.dart';
import 'package:bookmeup/widgets/navigationbar.dart';

class TrendingWidget extends StatefulWidget {
  @override
  _TrendingWidget createState() => _TrendingWidget();
}

int _index = 0;

class _TrendingWidget extends State<TrendingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tendencias',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'DESTACADOS',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Para los que aman el amor',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton(
                  onPressed: () {},
                  color: CupertinoColors.black,
                  child: Text(
                    'Trending',
                    style:
                        TextStyle(fontSize: 24, color: CupertinoColors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        width: 100,
                        child: Center(
                            child: Text(
                          "ListView 1",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))),
                ],
              ),
            ),
            NavigationBarWidget(1),
          ],
        ),
      ),
    );
  }
}
