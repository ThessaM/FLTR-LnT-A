
import 'book.dart';

void main() {
  Story story = Story();
  Book book = Book();
  book.name = "Once Upon a Time";
  story.book = book;
  story.character = "Helga";

  story.intro();
}