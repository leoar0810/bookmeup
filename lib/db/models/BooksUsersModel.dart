class BooksUserModel {
  int id;
  int userid;
  int bookid;
  int starts;
  int pages;
  int toread;
  int status;
  String title;
  String author;
  String ISBN;
  String description;
  String cover;
  int pagesreaded;

  BooksUserModel({
    required this.id,
    required this.userid,
    required this.bookid,
    required this.starts,
    required this.pages,
    required this.toread,
    required this.status,
    required this.title,
    required this.author,
    required this.ISBN,
    required this.description,
    required this.cover,
    required this.pagesreaded,
  });

  BooksUserModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        userid = item["userid"],
        bookid = item["bookid"],
        starts = item["starts"],
        pages = item["pages"],
        toread = item["toread"],
        status = item["status"],
        title = item["title"],
        author = item["author"],
        ISBN = item["ISBN"],
        description = item["description"],
        cover = item["cover"],
        pagesreaded = item["pagesreaded"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "userid": userid,
      "bookid": bookid,
      "starts": starts,
      "pages": pages,
      "toread": toread,
      "status": status,
      "title": title,
      "author": author,
      "ISBN": ISBN,
      "description": description,
      "cover": cover,
      "pagesreaded": pagesreaded,
    };
  }
}
