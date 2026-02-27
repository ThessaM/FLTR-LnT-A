

import 'object.dart';


extension IntExtension on int {

  bool isNumberMoreThan10() => this > 10;

  // bool isNumberMoreThan10() {
  //   return this > 10;
  // }
}

void main(){

  int apple = 5;
  int orange = 9;

  print(orange.isNumberMoreThan10());
  print(apple.isNumberMoreThan10());

  Book book = Book("Hello", 20, "You");
  print("${book.title} has ${book.page} pages");

  print(book.getAuthor);
  book.intro();

  print(book.page.isNumberMoreThan10());
}