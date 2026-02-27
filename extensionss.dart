import 'book.dart';

extension BookExtension on Book {
  void detail(){
    print("this book has $page pages");
  }
}

extension IntExtension on int {
  bool isMoreThan10() => this > 10;
}

void main() {
  int num = 5;
  print(num.isMoreThan10());

  Book book = Book();
  book.name = "Hello";
  book.page = 45;
  book.detail();
}