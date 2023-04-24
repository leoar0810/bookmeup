class BookModel {
  final int id;
  final String title;
  final String author;
  final String ISBN;
  final String description;
  final String cover;
  final int pages;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.ISBN,
    required this.description,
    required this.cover,
    required this.pages,
  });

  BookModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        title = item["title"],
        author = item["author"],
        ISBN = item["ISBN"],
        description = item["description"],
        cover = item["cover"],
        pages = item["pages"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "title": title,
      "author": author,
      "ISBN": ISBN,
      "description": description,
      "cover": cover,
      "pages": pages,
    };
  }
}
