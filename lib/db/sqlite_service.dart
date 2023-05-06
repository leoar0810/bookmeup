import 'dart:convert';
import 'dart:ffi';

import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database9.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT,  name TEXT, username TEXT, password TEXT, description TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Books(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, author TEXT NOT NULL, ISBN TEXT NOT NULL, description TEXT NOT NULL, cover TEXT, pages INT)",
        );

        await database.execute(
          "CREATE TABLE BooksUsers(id INTEGER PRIMARY KEY AUTOINCREMENT,  userid INT, bookid INT, starts INT, pages INT, toread INT, status INT, title TEXT, author TEXT, ISBN TEXT, description TEXT, cover TEXT, pagesreaded INT, FOREIGN KEY(userid) REFERENCES Users(id), FOREIGN KEY(bookid) REFERENCES Books(id))",
        );
        await database.execute(
          "CREATE TABLE TimeReading(id INTEGER PRIMARY KEY AUTOINCREMENT,  bookid INT, userid INT, pagesRead INT, day TEXT, date TEXT, time INT, FOREIGN KEY(bookid) REFERENCES Books(id), FOREIGN KEY(userid) REFERENCES Users(id))",
        );
        await database.execute(
          "CREATE TABLE Alarms(id INTEGER PRIMARY KEY AUTOINCREMENT, userid INT, day TEXT, time TEXT, status INT, FOREIGN KEY(userid) REFERENCES Users(id))",
        );
        await database.execute(
          "Insert INTO Users(name, username, password, description) VALUES('Admin', 'admin name', 'admin', 'I am Admin')",
        );
        await database.execute(
          "INSERT INTO Books(title, author, ISBN, description, cover, pages) VALUES('The Lord of the Rings', 'J. R. R. Tolkien', '978-0-618-57498-5', 'The Lord of the Rings is an ezic high-fantasy novel written by English author and scholar J. R. R. Tolkien. The story began as a sequel to Tolkien''s.', 'https://images-na.ssl-images-amazon.com/images/I/51%2B1s%2B1FdgL._SX331_BO1,204,203,200_.jpg', 1178)",
        );
        await database.execute(
          "INSERT INTO BooksUsers(userid, bookid, starts, pages, toread, status, title, author, ISBN, description, cover, pagesreaded) VALUES(1, 1, 5, 0, 0, 0, 'The Lord of the Rings', 'J. R. R. Tolkien', '978-0-618-57498-5', 'The Lord of the Rings is an ezic high-fantasy novel written by English author and scholar J. R. R. Tolkien. The story began as a sequel to Tolkien''s.', 'https://images-na.ssl-images-amazon.com/images/I/51%2B1s%2B1FdgL._SX331_BO1,204,203,200_.jpg', 0)",
        );
      },
      version: 1,
    );
  }

  //adding

  Future<void> addUser(UserModel usermodel) async {
    final Database db = await initializeDB();
    await db.insert('Users', usermodel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> addBook(BookModel bookmodel) async {
    final Database db = await initializeDB();
    await db.insert('Books', bookmodel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> addBooksUser(BooksUserModel booksusermodel) async {
    final Database db = await initializeDB();
    await db.rawInsert(
        "INSERT INTO BooksUsers(userid, bookid, starts, pages, toread, status, title, author, ISBN, description, cover, pagesreaded) VALUES(${booksusermodel.userid}, ${booksusermodel.bookid}, ${booksusermodel.starts}, ${booksusermodel.pages}, ${booksusermodel.toread}, ${booksusermodel.status}, '${booksusermodel.title}', '${booksusermodel.author}', '${booksusermodel.ISBN}', '${booksusermodel.description}', '${booksusermodel.cover}', ${booksusermodel.pagesreaded})");
  }

  Future<void> addTimeReading(TimeReadingModel timereadingmodel) async {
    final Database db = await initializeDB();
    await db.insert('TimeReading', timereadingmodel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> addAlarm(AlarmsModel alarmmodel) async {
    final Database db = await initializeDB();
    await db.insert('Alarms', alarmmodel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //getting

  Future<List<BookModel>> getBooks() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Books');
    return queryResult.map((e) => BookModel.fromMap(e)).toList();
  }

  Future<List<BooksUserModel>> getBooksUsers() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('BooksUsers');
    return queryResult.map((e) => BooksUserModel.fromMap(e)).toList();
  }

  Future<List<UserModel>> getUsers() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Users');
    return queryResult.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<List<TimeReadingModel>> getTimeReading(int userid) async {
    final db = await initializeDB();
    List<Map<String, Object?>> result = await db
        .rawQuery('SELECT * FROM TimeReading WHERE userid=? ', [userid]);
    return result.map((e) => TimeReadingModel.fromMap(e)).toList();
  }

  Future<List<AlarmsModel>> getAlarms(int userid) async {
    final db = await initializeDB();
    List<Map<String, Object?>> result =
        await db.rawQuery('SELECT * FROM Alarms WHERE userid=? ', [userid]);
    return result.map((e) => AlarmsModel.fromMap(e)).toList();
  }

  //------------------------------------------------------------------------------------

  //updating

  Future<void> updateBook(BookModel bookmodel) async {
    final db = await initializeDB();
    await db.update(
      'Books',
      bookmodel.toMap(),
      where: "id = ?",
      whereArgs: [bookmodel.id],
    );
  }

  Future<void> updateBooksUser(BooksUserModel booksusermodel) async {
    print(booksusermodel.toMap());
    final db = await initializeDB();
    await db.update(
      'BooksUsers',
      booksusermodel.toMap(),
      where: "id = ?",
      whereArgs: [booksusermodel.id],
    );
  }

  Future<void> updateTimeReading(TimeReadingModel timereadingmodel) async {
    final db = await initializeDB();
    await db.update(
      'TimeReading',
      timereadingmodel.toMap(),
      where: "id = ?",
      whereArgs: [timereadingmodel.id],
    );
  }

  Future<void> updateAlarm(AlarmsModel alarmmodel) async {
    final db = await initializeDB();
    await db.update(
      'Alarms',
      alarmmodel.toMap(),
      where: "id = ?",
      whereArgs: [alarmmodel.id],
    );
  }

  Future<void> updateUser(UserModel usermodel) async {
    final db = await initializeDB();
    await db.update(
      'Users',
      usermodel.toMap(),
      where: "id = ?",
      whereArgs: [usermodel.id],
    );
  }

  //------------------------------------------------------------------------------------

  //deleting

  Future<void> deleteBook(int id) async {
    final db = await initializeDB();
    await db.delete(
      'Books',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteBooksUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'BooksUsers',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteAlarm(int id) async {
    final db = await initializeDB();
    await db.delete(
      'Alarms',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteTimeReading(int id) async {
    final db = await initializeDB();
    await db.delete(
      'TimeReading',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'Users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final db = await initializeDB();
    await db.delete('Books');
    await db.delete('BooksUsers');
    await db.delete('TimeReading');
    await db.delete('Alarms');
    await db.delete('Users');
  }
}
