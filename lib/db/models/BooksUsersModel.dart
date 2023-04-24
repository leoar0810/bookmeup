class BooksUserModel {
  final int id;
  final int userid;
  final int bookid;
  final int starts;
  final int pages;
  final int toread;
  final int status;

  BooksUserModel({
    required this.id,
    required this.userid,
    required this.bookid,
    required this.starts,
    required this.pages,
    required this.toread,
    required this.status,
  });

  BooksUserModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        userid = item["userid"],
        bookid = item["bookid"],
        starts = item["starts"],
        pages = item["pages"],
        toread = item["toread"],
        status = item["status"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "userid": userid,
      "bookid": bookid,
      "starts": starts,
      "pages": pages,
      "toread": toread,
      "status": status,
    };
  }
}
