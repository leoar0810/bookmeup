import 'package:bookmeup/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookmeup/db/models/AlarmsModel.dart';
import 'package:bookmeup/db/models/BookModel.dart';
import 'package:bookmeup/db/models/BooksUsersModel.dart';
import 'package:bookmeup/db/models/TimeReadingModel.dart';
import 'package:bookmeup/db/models/userModel.dart';
import 'package:bookmeup/domain/useCase/booksCases.dart';

class ReadingController extends GetxController {
  static ReadingController get to => Get.find<ReadingController>();
  GeneralController generalController = Get.find();
  RxInt booksReadInMonth = 0.obs;
  List booksread = [].obs;
  List names = [].obs;

  Future<void> calculateBooksReadInMonth() async {
    int booksReadInMonth1 = 0;
    final prefs = await SharedPreferences.getInstance();
    for (var book in generalController.timeReading) {
      if (book.userid == 1 &&
          DateTime.parse(book.date).month == DateTime.now().month) {
        booksReadInMonth1++;
        print('slkafjsljfkdsfjasfjdsjfalkdsf');
      }
    }
    booksReadInMonth.value = booksReadInMonth1;
  }

  Future<void> calculateBooksReads() async {
    List booksread1 = [];
    final prefs = await SharedPreferences.getInstance();
    for (var book in generalController.booksUser) {
      if (book.userid == 1 && book.toread == 0) {
        booksread1.add(book);
        await bookName(book.bookid);
      }
    }
    booksread = booksread1;
    print('readed' + booksread.length.toString());
  }

  Future<void> bookName(int id) async {
    List name = [];
    final prefs = await SharedPreferences.getInstance();
    for (var book in generalController.books) {
      if (book.id == id) {
        name.add(book.title);
      }
    }
    names = name;
  }

  @override
  void onInit() async {
    super.onInit();
    await calculateBooksReadInMonth();
    await calculateBooksReads();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
