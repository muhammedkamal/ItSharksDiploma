abstract class Person {
//declaring abstract method

  void displayInfo(); //abstract method

}

class Boy extends Person {
// Overriding method
  void displayInfo() {
    print("My name is Muhammad");
  }
}

class Girl extends Person {
// Overriding method
  void displayInfo() {
    print("My name is Ola");
  }
}

void main() {
  Person b = Boy(); // Creating Object of Boy class
  Girl g = Girl(); // Creating Object of Girl class

  b.displayInfo();
  g.displayInfo();
}
