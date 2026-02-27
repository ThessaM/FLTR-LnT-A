


//Class
// class Person{
//   String name;
//   int age;

//   Person(this.name, this.age);
//   Person.nameOnly(this.name, {this.age = 30});

//   void greeting(){
//     print("Hello my name is $name");
//   }
// }


class Person {
  //Encapsulation
  String? _name; //declare as private

  String? get name => _name;
  set name(String newName) => _name = newName;

  String get detail => "My name is $_name";
}

class Animal {
  String name;
  String type;

  Animal(this.name, this.type);

  void eat() {
    print("$name is eating");
  }
}

//Single Inheritance
class Dog extends Animal {

  String sound = "Woof";
  
  Dog(name) : super(name, 'Mammal');

  //polymorphism
  @override
  void eat() {
    print("$name is sleeping");
  }

  void speak(){
    print("$name says $sound");
  }

  String run(){
    return "$name is running";
  }

  void sit(int length){
    print("$name will sit for $length minutes");
  }

  String drink(String drink){
    return "$name is drinking $drink";
  }
}

//Hierarchical Inheritance
class Cat extends Animal {
  
  Cat(super.name, super.type);

  @override
  void eat() {
    print("$name is eating cat food");
  }

}

//Multilevel Inheritance
class GoldenRetriever extends Dog implements Action {
  
  GoldenRetriever() : super("Golden");
  
  @override
  void walk() {
    print("$name is walking with 4 legs");
  }

}

//Abstraction
abstract class Action {
  void walk();
}


void main(){
  //Object
  // Person person1 = Person("Michael", 18);
  // print(person1.name);
  // print(person1.age);
  // person1.greeting();

  // Person person2 = Person();
  // print(person2.name);
  // person2.name = "John";
  // person2.age = 23;
  // print(person2.name);
  // print(person2.age);
  // person2.greeting();

  // Person person3 = Person.nameOnly("Amy");
  // print(person3.name);
  // print(person3.age);
  // person3.age = 25;
  // print(person3.age);
  // person3.greeting();

  //Encapsulation
  Person person4 = Person();
  person4.name = "Sophia";
  print(person4.name);
  print(person4.detail);


  //Inheritance
  Dog dog1 = Dog("Husky");
  print(dog1.name);
  print(dog1.type);
  dog1.eat();
  dog1.speak();
  print(dog1.run());
  dog1.sit(8);
  print(dog1.drink("water"));

  GoldenRetriever golden1 = GoldenRetriever();
  print(golden1.name);
  print(golden1.type);
  golden1.eat(); // Polymorphism
  golden1.walk(); //Abstraction
  golden1.speak();


  Cat cat1 = Cat("Angora", "Mammal");
  print(cat1.name);
  print(cat1.type);
  cat1.eat();
}