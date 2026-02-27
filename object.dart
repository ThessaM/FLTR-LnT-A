

class Book {
  String title; //public
  int page;
  String _author; //private

  Book(this.title, this.page, this._author);

  String get getAuthor => _author;
  set author(String newAuthor) => author = newAuthor;


  void intro(){
    print("$title is written by $_author");
  }

}