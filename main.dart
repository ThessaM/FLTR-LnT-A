

class Animal {
  // String? name;

  void speak(){
    print("Hello");
  }
}

class Dog extends Animal {
  
  @override
  void speak() {
    print("Bark");
  }
}

class Cat extends Animal {
  @override
  void speak() {
    print("Meow");
  }
}


void main (){
  var dog = Animal();
  dog.speak();

  var golden = Dog();
  golden.speak();

  var cat = Cat();
  cat.speak();
}