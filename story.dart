
part of packTrial;

class Story {
  String? character;
  Book? book;

  void intro(){
    print("$character in a book called ${book!._title}");
  }
}