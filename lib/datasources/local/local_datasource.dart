import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/FriendModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/sqlite_service.dart';
import 'package:bookmeup/pages/friend/friend.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocalDataSource {
  final db = SqliteService();

  List<BookModel> books = <BookModel>[];
  List<BooksUserModel> booksUser = <BooksUserModel>[];
  List<TimeReadingModel> timeReading = <TimeReadingModel>[];
  List<AlarmsModel> alarms = <AlarmsModel>[];
  List<UserModel> users = <UserModel>[];
  List<FriendModel> friends = <FriendModel>[];

  Future<void> initialize() async {
    await initBooks();
    await initBooksUser();
    await initTimeReading();
    await initAlarms();
    await initUsers();
    await initFriends();
  }

  Future<void> initBooks() async {
    books = await db.getBooks();
  }

  Future<void> initBooksUser() async {
    booksUser = await db.getBooksUsers();
  }

  Future<void> initFriends() async {
    friends = await db.getFriends();
  }

  Future<void> initTimeReading() async {
    final prefs = await SharedPreferences.getInstance();
    // fijar valor
    final userg = prefs.getString('user') ?? '';
    timeReading = await db.getTimeReading(userg);
  }

  Future<void> initAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    // fijar valor
    final userg = prefs.getString('user') ?? '';
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

  List<FriendModel> getFriend() {
    return friends;
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

  Future<void> updateFriend(FriendModel friendModel) async {
    await db.updateFriends(friendModel);
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

  //inserting
  Future<void> insertBook(BookModel book) async {
    await db.addBook(book);
    await initBooks();
  }

  Future<void> insertFriend(FriendModel friendModel) async {
    await db.addFriend(friendModel);
    await initBooks();
  }

  Future<void> insertBooksUser(BooksUserModel bookUser) async {
    await db.addBooksUser(bookUser);
    await initBooksUser();
  }

  Future<void> insertTimeReading(TimeReadingModel timeReading) async {
    await db.addTimeReading(timeReading);
    await initTimeReading();
  }

  Future<void> insertAlarms(AlarmsModel alarm) async {
    await db.addAlarm(alarm);
    await initAlarms();
  }

  Future<void> insertUser(UserModel user) async {
    await db.addUser(user);
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

  Future<void> deleteFriend(FriendModel friendModel) async {
    await db.deleteFriend(friendModel.id);
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

  Future<void> deleteall() async {
    await db.deleteAll();
    await initUsers();
  }

  void copyListToFirestore(List<Map<String, dynamic>> dataList,
      String collectionName, String user) async {
    // get a reference to the Firestore collection
    CollectionReference collectionRef = FirebaseFirestore.instance
        .collection(user)
        .doc('booksUser')
        .collection(collectionName);

    // iterate through the list and add each item to Firestore
    for (var data in dataList) {
      await collectionRef.add(data);
    }
  }

  void copyInfoToFireStore(Map<String, dynamic> dataList, String user) async {
    // get a reference to the Firestore collection
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(user);

    // iterate through the list and add each item to Firestore

    await collectionRef.add(dataList);
  }

  Future<void> databasecopy() async {
    final prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString('user');
    List<Map<String, dynamic>> books = [];
    for (BooksUserModel book in booksUser) {
      if (book.userid == user) {
        books.add(book.toMap());
      }
    }
    copyListToFirestore(books, 'booksUser', user!);

    List<Map<String, dynamic>> alarmsl = [];
    for (AlarmsModel alarm in alarms) {
      if (alarm.userid == user) {
        alarmsl.add(alarm.toMap());
      }
    }
    copyListToFirestore(alarmsl, 'alarms', user);
    //function that return the user element where the id is the same as the user
    //and then we get the user id and we use it to copy the data to firestore
    for (UserModel userm in users) {
      if (userm.id == user) {
        print('asfsdkfsdjfasjklfjdlsfjksldajfd');
        copyInfoToFireStore(userm.toMap(), user);
        break;
      }
    }
  }

  Future<void> getBooksFromFirestore() async {
    final CollectionReference booksCollection = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('booksUser')
        .collection('booksUser');
    final QuerySnapshot querySnapshot = await booksCollection.get();

    querySnapshot.docs.forEach((doc) async {
      BooksUserModel bum = BooksUserModel(
        id: doc.get('id'),
        userid: FirebaseAuth.instance.currentUser!.uid,
        bookid: doc.get('bookid'),
        starts: doc.get('starts'),
        pages: doc.get('pages'),
        toread: doc.get('toread'),
        status: doc.get('status'),
        title: doc.get('title'),
        author: doc.get('author'),
        ISBN: doc.get('ISBN'),
        description: doc.get('description'),
        cover: doc.get('cover'),
        pagesreaded: doc.get('pagesreaded'),
      );
      print(bum.toMap());
      insertBooksUser(bum);
    });

//adding user

    final CollectionReference booksCollection1 = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid);

    final QuerySnapshot querySnapshot1 = await booksCollection1.get();

    querySnapshot1.docs.forEach((doc) async {
      UserModel userm = UserModel(
        id: doc.get('id'),
        name: doc.get('name'),
        username: doc.get('username'),
        password: doc.get('password'),
        description: doc.get('description'),
      );
      await insertUser(userm);
      print(users[0].toMap());
    });
  }
}
