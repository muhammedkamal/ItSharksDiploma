import 'dart:io';

void main() {
  print("please enter your age");
  int age = int.parse(stdin.readLineSync()!);
  if (age > 18) {
    print("Adult");
  } else {
    print("Child");
  }
}
