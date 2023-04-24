import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/sqlite_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final db = SqliteService();

  List<BookModel> books = <BookModel>[];
  List<BooksUserModel> booksUser = <BooksUserModel>[];
  List<TimeReadingModel> timeReading = <TimeReadingModel>[];
  List<AlarmsModel> alarms = <AlarmsModel>[];
  List<UserModel> users = <UserModel>[];

  Future<void> initialize() async {
    await initBooks();
    await initBooksUser();
    await initTimeReading();
    await initAlarms();
    await initUsers();
  }

  Future<void> initBooks() async {
    books = await db.getBooks();
  }

  Future<void> initBooksUser() async {
    booksUser = await db.getBooksUsers();
  }

  Future<void> initTimeReading() async {
    final prefs = await SharedPreferences.getInstance();
    // fijar valor
    final userg = prefs.getInt('user') ?? 0;
    timeReading = await db.getTimeReading(userg);
  }

  Future<void> initAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    // fijar valor
    final userg = prefs.getInt('user') ?? 0;
    alarms = await db.getAlarms(userg);
  }

  Future<void> initUsers() async {
    users = await db.getUsers();
  }

  //getting

  List<BookModel> getBooks() {
    return books;
  }

  List<BooksUserModel> getBooksUser() {
    return booksUser;
  }

  List<TimeReadingModel> getTimeReading() {
    return timeReading;
  }

  List<AlarmsModel> getAlarms() {
    return alarms;
  }

  List<UserModel> getUsers() {
    return users;
  }

  //updating

  Future<void> updateBook(BookModel book) async {
    await db.updateBook(book);
    await initBooks();
  }

  Future<void> updateBooksUser(BooksUserModel bookUser) async {
    await db.updateBooksUser(bookUser);
    await initBooksUser();
  }

  Future<void> updateTimeReading(TimeReadingModel timeReading) async {
    await db.updateTimeReading(timeReading);
    await initTimeReading();
  }

  Future<void> updateAlarms(AlarmsModel alarm) async {
    await db.updateAlarm(alarm);
    await initAlarms();
  }

  Future<void> updateUser(UserModel user) async {
    await db.updateUser(user);
    await initUsers();
  }

  //deleting

  Future<void> deleteBook(BookModel book) async {
    await db.deleteBook(book.id);
    await initBooks();
  }

  Future<void> deleteBooksUser(BooksUserModel bookUser) async {
    await db.deleteBooksUser(bookUser.id);
    await initBooksUser();
  }

  Future<void> deleteTimeReading(TimeReadingModel timeReading) async {
    await db.deleteTimeReading(timeReading.id);
    await initTimeReading();
  }

  Future<void> deleteAlarms(AlarmsModel alarm) async {
    await db.deleteAlarm(alarm.id);
    await initAlarms();
  }

  Future<void> deleteUser(UserModel user) async {
    await db.deleteUser(user.id);
    await initUsers();
  }
}
