import 'package:bookmeup/controllers/generalcontroller.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final BooksUserModel book;
  const ListItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.find();
    int id = book.id ?? 0;
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Deleting",
                style: TextStyle(color: Colors.white),
              ),
            )),
        onDismissed: (direction) {
          // Remove the item from the data source.
          generalController.deleteBooksUser(book);
        },
        child: Card(
          key: Key('userItem' + id.toString()),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  // leading: CircleAvatar(
                  //   radius: 30.0,
                  //   backgroundColor: Colors.transparent,
                  //   child: ClipOval(child: Image.network(user.picture)),
                  // ),
                  title: Text(book.id.toString()),
                  subtitle: Text(book.pages.toString()),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => Get.back);
                },
                child: const Text("more"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
