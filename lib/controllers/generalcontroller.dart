import 'package:bookmeup/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/domain/useCase/booksCases.dart';

class GeneralController extends GetxController {
  static GeneralController get to => Get.find<GeneralController>();
  BookCases bookCases = BookCases();

  RxList<BookModel> books = <BookModel>[].obs;
  RxList<BooksUserModel> booksUser = <BooksUserModel>[].obs;
  RxList<TimeReadingModel> timeReading = <TimeReadingModel>[].obs;
  RxList<AlarmsModel> alarms = <AlarmsModel>[].obs;
  RxList<UserModel> users = <UserModel>[].obs;

  Future<void> getBooks() async {
    books.value = await bookCases.getBooks();
    books.refresh();
  }

  Future<void> getBooksUser() async {
    booksUser.value = await bookCases.getBooksUser();
    booksUser.refresh();
  }

  Future<void> getTimeReading() async {
    timeReading.value = await bookCases.getTimeReading();
    timeReading.refresh();
  }

  Future<void> getAlarms() async {
    alarms.value = await bookCases.getAlarms();
    alarms.refresh();
  }

  Future<void> getUsers() async {
    users.value = await bookCases.getUsers();
    users.refresh();
  }

  //inserting

  Future<void> insertBook(BookModel book) async {
    await bookCases.insertBook(book);
    await getBooks();
  }

  Future<void> insertBooksUser(BooksUserModel bookUser) async {
    await bookCases.insertBooksUser(bookUser);
    await getBooksUser();
  }

  Future<void> insertTimeReading(TimeReadingModel timeReading) async {
    await bookCases.insertTimeReading(timeReading);
    await getTimeReading();
  }

  Future<void> insertAlarms(AlarmsModel alarm) async {
    await bookCases.insertAlarms(alarm);
    await getAlarms();
  }

  Future<void> insertUser(UserModel user) async {
    await bookCases.insertUser(user);
    await getUsers();
  }

  //updating

  Future<void> updateBook(BookModel book) async {
    await bookCases.updateBook(book);
    await getBooks();
  }

  Future<void> updateBooksUser(BooksUserModel bookUser) async {
    await bookCases.updateBooksUser(bookUser);
    await getBooksUser();
  }

  Future<void> updateTimeReading(TimeReadingModel timeReading) async {
    await bookCases.updateTimeReading(timeReading);
    await getTimeReading();
  }

  Future<void> updateAlarms(AlarmsModel alarm) async {
    await bookCases.updateAlarms(alarm);
    await getAlarms();
  }

  Future<void> updateUser(UserModel user) async {
    await bookCases.updateUser(user);
    await getUsers();
  }

  //deleting

  Future<void> deleteBook(BookModel book) async {
    await bookCases.deleteBook(book);
    await getBooks();
  }

  Future<void> deleteBooksUser(BooksUserModel bookUser) async {
    await bookCases.deleteBooksUser(bookUser);
    await getBooksUser();
  }

  Future<void> deleteTimeReading(TimeReadingModel timeReading) async {
    await bookCases.deleteTimeReading(timeReading);
    await getTimeReading();
  }

  Future<void> deleteAlarms(AlarmsModel alarm) async {
    await bookCases.deleteAlarms(alarm);
    await getAlarms();
  }

  Future<void> deleteUser(UserModel user) async {
    await bookCases.deleteUser(user);
    await getUsers();
  }

  @override
  void onInit() async {
    super.onInit();
    await bookCases.initialize();
    await getBooks();
    await getBooksUser();
    await getTimeReading();
    await getAlarms();
    await getUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
