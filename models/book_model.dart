class BookModel {
  BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.year,
  });
  int id;
  String name;
  String author;
  String year;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'year': year,
    };
  }
}
