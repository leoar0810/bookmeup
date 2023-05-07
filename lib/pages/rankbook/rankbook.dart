import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:flutter/material.dart';
import 'package:bookmeup/index.dart';
import 'package:bookmeup/widgets/navigationbar.dart';

class RankbookScreen extends StatefulWidget {
  final String imageUrl;

  RankbookScreen({required this.imageUrl});

  @override
  _RankbookScreenState createState() => _RankbookScreenState();
}

class _RankbookScreenState extends State<RankbookScreen> {
  List<bool> _starStates = [false, false, false, false, false];
  int _rating = 0;
  GeneralController generalController = Get.find();
  BooksUserModel data = Get.arguments[0];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < data.starts; i++) {
      _starStates[i] = true;
    }
    _rating = data.starts;
  }

  void _updateRating(int rating) {
    setState(() {
      _rating = rating;
      for (int i = 0; i < _starStates.length; i++) {
        _starStates[i] = i < rating;
      }
      print(_rating);
      data.starts = _rating;
      generalController.updateBooksUser(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Bookmeup',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Book Finished!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'You have earned the Rookie badge.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Review',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _starStates[0] ? Icons.star : Icons.star_border,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () => _updateRating(1),
                      ),
                      IconButton(
                        icon: Icon(
                          _starStates[1] ? Icons.star : Icons.star_border,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () => _updateRating(2),
                      ),
                      IconButton(
                        icon: Icon(
                          _starStates[2] ? Icons.star : Icons.star_border,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () => _updateRating(3),
                      ),
                      IconButton(
                        icon: Icon(
                          _starStates[3] ? Icons.star : Icons.star_border,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () => _updateRating(4),
                      ),
                      IconButton(
                        icon: Icon(
                          _starStates[4] ? Icons.star : Icons.star_border,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () => _updateRating(5),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        data.starts = _rating;
                        print(data.starts);
                        await generalController.updateBooksUser(data);
                        Get.to(() => ReadingStatsWidget());
                      },
                      child: Text(
                        'Submit Review',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(150, 60),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarWidget(2),
    );
  }
}
