class TimeReadingModel {
  final int id;
  final int bookid;
  final String userid;
  final int pagesRead;
  final String day;
  final String date;
  final int time;

  TimeReadingModel({
    required this.id,
    required this.bookid,
    required this.userid,
    required this.pagesRead,
    required this.day,
    required this.date,
    required this.time,
  });

  TimeReadingModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        bookid = item["bookid"],
        userid = item["userid"],
        pagesRead = item["pagesRead"],
        day = item["day"],
        date = item["date"],
        time = item["time"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "bookid": bookid,
      "userid": userid,
      "pagesRead": pagesRead,
      "day": day,
      "date": date,
      "time": time,
    };
  }
}
