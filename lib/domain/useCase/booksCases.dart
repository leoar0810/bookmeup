import 'package:bookmeup/datasources/local/local_datasource.dart';
import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookCases {
  var repo = LocalDataSource();

  Future<void> initialize() async {
    await repo.initialize();
  }

  //getting

  Future<List<BookModel>> getBooks() async {
    return repo.books;
  }

  Future<List<BooksUserModel>> getBooksUser() async {
    return repo.booksUser;
  }

  Future<List<TimeReadingModel>> getTimeReading() async {
    return repo.timeReading;
  }

  Future<List<AlarmsModel>> getAlarms() async {
    return repo.alarms;
  }

  Future<List<UserModel>> getUsers() async {
    return repo.users;
  }

  //inserting

  Future<void> insertBook(BookModel book) async {
    await repo.insertBook(book);
  }

  Future<void> insertBooksUser(BooksUserModel bookUser) async {
    await repo.insertBooksUser(bookUser);
  }

  Future<void> insertTimeReading(TimeReadingModel timeReading) async {
    await repo.insertTimeReading(timeReading);
  }

  Future<void> insertAlarms(AlarmsModel alarm) async {
    await repo.insertAlarms(alarm);
  }

  Future<void> insertUser(UserModel user) async {
    await repo.insertUser(user);
  }

  //updating

  Future<void> updateBook(BookModel book) async {
    await repo.updateBook(book);
  }

  Future<void> updateBooksUser(BooksUserModel bookUser) async {
    await repo.updateBooksUser(bookUser);
  }

  Future<void> updateTimeReading(TimeReadingModel timeReading) async {
    await repo.updateTimeReading(timeReading);
  }

  Future<void> updateAlarms(AlarmsModel alarm) async {
    await repo.updateAlarms(alarm);
  }

  Future<void> updateUser(UserModel user) async {
    await repo.updateUser(user);
  }

  //deleting

  Future<void> deleteBook(BookModel book) async {
    await repo.deleteBook(book);
  }

  Future<void> deleteBooksUser(BooksUserModel bookUser) async {
    await repo.deleteBooksUser(bookUser);
  }

  Future<void> deleteTimeReading(TimeReadingModel timeReading) async {
    await repo.deleteTimeReading(timeReading);
  }

  Future<void> deleteAlarms(AlarmsModel alarm) async {
    await repo.deleteAlarms(alarm);
  }

  Future<void> deleteUser(UserModel user) async {
    await repo.deleteUser(user);
  }
}
