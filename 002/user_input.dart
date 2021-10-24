import 'dart:io';

void main() {
  print("please enter your age");
  String? str = stdin.readLineSync();
  if (str != null) {
    int age = int.parse(str);
    if (age > 18) {
      print("Adult");
    } else {
      print("Child");
    }
  }
}
