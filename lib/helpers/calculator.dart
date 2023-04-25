import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';

class Calculator {
  // function that calculate the number of books to read of a particular userid
  static int calculateBooksToRead(List<BooksUserModel> booksUser, int userId) {
    int booksToRead = 0;
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId && bookUser.toread == 1) {
        booksToRead += 1;
      }
    }
    return booksToRead;
  }

  // function that calculate the number of books readed of a particular userid
  static int calculateBooksReaded(List<BooksUserModel> booksUser, int userId) {
    int booksReaded = 0;
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId && bookUser.toread == 0) {
        booksReaded += 1;
      }
    }
    return booksReaded;
  }

  // function that calculate the number of books to rank of a particular userid
  static int calculateBooksToRank(List<BooksUserModel> booksUser, int userId) {
    int booksToRank = 0;
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId && bookUser.starts == -1) {
        booksToRank += 1;
      }
    }
    return booksToRank;
  }

  // function that calculate the number of books ranked of a particular userid
  static int calculateBooksRanked(List<BooksUserModel> booksUser, int userId) {
    int booksRanked = 0;
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId && bookUser.starts != -1) {
        booksRanked += 1;
      }
    }
    return booksRanked;
  }

  // function that calculate a list booksuser of a particular userid
  static List<BooksUserModel> calculateBooksUser(
      List<BooksUserModel> booksUser, int userId) {
    List<BooksUserModel> booksUserList = [];
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId) {
        booksUserList.add(bookUser);
      }
    }
    return booksUserList;
  }

  // function that calculate the number of pages readed of a particular userid
  static int calculatePagesReaded(List<BooksUserModel> booksUser, int userId) {
    int pagesReaded = 0;
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId) {
        pagesReaded += bookUser.pages;
      }
    }
    return pagesReaded;
  }

  //function that calculate a list of boooksuser that not have a particular userid
  static List<BooksUserModel> calculateNotBooksUser(
      List<BooksUserModel> booksUser, int userId) {
    List<BooksUserModel> booksUserList = [];
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid != userId) {
        booksUserList.add(bookUser);
      }
    }
    return booksUserList;
  }

  // function that calculate the number of pages readed of a book of a particular userid
  static int calculatePagesReadedBook(
      List<BooksUserModel> booksUser, int userId, int bookId) {
    int pagesReaded = 0;
    for (BooksUserModel bookUser in booksUser) {
      if (bookUser.userid == userId && bookUser.bookid == bookId) {
        pagesReaded += bookUser.pages;
      }
    }
    return pagesReaded;
  }

  //function that calculate the time of lecture of a particular userid
  static int calculateTimeReading(
      List<TimeReadingModel> timeReading, int userId) {
    int time = 0;
    for (TimeReadingModel timeRead in timeReading) {
      if (timeRead.userid == userId) {
        time += timeRead.time;
      }
    }
    return time;
  }

  //function that calculate the number of diferent days reading of a particular userid based on the date
  static int calculateDaysReading(
      List<TimeReadingModel> timeReading, int userId) {
    int days = 0;
    List<String> dates = [];
    for (TimeReadingModel timeRead in timeReading) {
      if (timeRead.userid == userId) {
        if (!dates.contains(timeRead.date)) {
          dates.add(timeRead.date);
          days += 1;
        }
      }
    }
    return days;
  }

  //function that calcule the number of days reading consecutive from a particular date to back

}
