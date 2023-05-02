import 'package:bookmeup/helpers/calculator.dart';
import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:flutter_test/flutter_test.dart';

//test for calculateBooksToRead
void main() {
  test('calculateBooksToRead', () {
    List<BooksUserModel> booksUser = [
      BooksUserModel(
          id: 1,
          userid: 1,
          bookid: 1,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 2,
          userid: 1,
          bookid: 2,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 3,
          userid: 1,
          bookid: 3,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 4,
          userid: 1,
          bookid: 4,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 5,
          userid: 1,
          bookid: 5,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 6,
          userid: 1,
          bookid: 6,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 7,
          userid: 1,
          bookid: 7,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 8,
          userid: 1,
          bookid: 8,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 9,
          userid: 1,
          bookid: 9,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 10,
          userid: 1,
          bookid: 10,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
    ];
    int userId = 1;
    int result = Calculator.calculateBooksToRead(booksUser, userId);
    expect(result, 5);
  });

  //test for calculateBooksReaded
  test('calculateBooksReaded', () {
    List<BooksUserModel> booksUser = [
      BooksUserModel(
          id: 1,
          userid: 1,
          bookid: 1,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 2,
          userid: 1,
          bookid: 2,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 3,
          userid: 1,
          bookid: 3,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 4,
          userid: 1,
          bookid: 4,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 5,
          userid: 1,
          bookid: 5,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 6,
          userid: 1,
          bookid: 6,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 7,
          userid: 1,
          bookid: 7,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 8,
          userid: 1,
          bookid: 8,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 9,
          userid: 1,
          bookid: 9,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 10,
          userid: 1,
          bookid: 10,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
    ];
    int userId = 1;
    int result = Calculator.calculateBooksReaded(booksUser, userId);
    expect(result, 5);
  });

  //test for calculateBooksToRank
  test('calculateBooksToRank', () {
    List<BooksUserModel> booksUser = [
      BooksUserModel(
          id: 1,
          userid: 1,
          bookid: 1,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 2,
          userid: 1,
          bookid: 2,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 3,
          userid: 1,
          bookid: 3,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 4,
          userid: 1,
          bookid: 4,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 5,
          userid: 1,
          bookid: 5,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 6,
          userid: 1,
          bookid: 6,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 7,
          userid: 1,
          bookid: 7,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 8,
          userid: 1,
          bookid: 8,
          toread: 0,
          starts: 1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 9,
          userid: 1,
          bookid: 9,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 10,
          userid: 1,
          bookid: 10,
          toread: 0,
          starts: 1,
          pages: 1,
          status: -1),
    ];
    int userId = 1;
    int result = Calculator.calculateBooksToRank(booksUser, userId);
    expect(result, 8);
  });

  //test for calculateBooksRanked
  test('calculateBooksRanked', () {
    List<BooksUserModel> booksUser = [
      BooksUserModel(
          id: 1,
          userid: 1,
          bookid: 1,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 2,
          userid: 1,
          bookid: 2,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 3,
          userid: 1,
          bookid: 3,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 4,
          userid: 1,
          bookid: 4,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 5,
          userid: 1,
          bookid: 5,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 6,
          userid: 1,
          bookid: 6,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 7,
          userid: 1,
          bookid: 7,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 8,
          userid: 1,
          bookid: 8,
          toread: 0,
          starts: 1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 9,
          userid: 1,
          bookid: 9,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 10,
          userid: 1,
          bookid: 10,
          toread: 0,
          starts: 1,
          pages: 1,
          status: -1),
    ];
    int userId = 1;
    int result = Calculator.calculateBooksRanked(booksUser, userId);
    expect(result, 2);
  });

  // test that calculate a list booksuser of a particular userid
  test('calculateBooksUser', () {
    List<BooksUserModel> booksUser = [
      BooksUserModel(
          id: 1,
          userid: 1,
          bookid: 1,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 2,
          userid: 2,
          bookid: 2,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 3,
          userid: 2,
          bookid: 3,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 4,
          userid: 2,
          bookid: 4,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 5,
          userid: 1,
          bookid: 5,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 6,
          userid: 1,
          bookid: 6,
          toread: 0,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 7,
          userid: 1,
          bookid: 7,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 8,
          userid: 1,
          bookid: 8,
          toread: 0,
          starts: 1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 9,
          userid: 1,
          bookid: 9,
          toread: 1,
          starts: -1,
          pages: 1,
          status: -1),
      BooksUserModel(
          id: 10,
          userid: 1,
          bookid: 10,
          toread: 0,
          starts: 1,
          pages: 1,
          status: -1),
    ];
    int userId = 1;
    List<BooksUserModel> result =
        Calculator.calculateBooksUser(booksUser, userId);
    expect(result.length, 7);
  });
}
