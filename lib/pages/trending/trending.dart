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
            Text(
              'Bookmeup',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 200),
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
            SizedBox(height: 200),
            NavigationBarWidget(1),
          ],
        ),
      ),
    );
  }
}
