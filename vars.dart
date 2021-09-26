/**
 * A variable is “a named space in the memory” that stores values.
 * In other words, it acts a container for values in a program.
 * Variable names are called identifiers. Following are the naming rules for an identifier.
 * Identifiers cannot be keywords.
 * Identifiers can contain alphabets and numbers.
 * Identifiers cannot contain spaces and special characters, except the underscore (_) and the dollar ($) sign.
 * Variable names cannot begin with a number
 * Variables in dart and flutter used lowerCamleCase
*/

void main() {
  // that will work
  var name = 'Smith';
  int num = 10;
  print(name);
  print(num);

  // that will cause an error
  //String name = 1; // if you un commented this line

  /* 
   Final and Const
  The final and const keyword are used to declare constants.
  Dart prevents modifying the values of a variable declared using the final or const keyword.
  These keywords can be used in conjunction with the variable’s data type or instead of the var keyword.
  The const keyword is used to represent a compile-time constant.
  Variables declared using the const keyword are implicitly final.
   */

  // that will work
  final val1 = 12;
  print(val1);
  const pi = 3.14;
  const area = pi * 12 * 12;
  print("The output is ${area}");

  // that will cause error
  final v1 = 12;
  const v2 = 13;
  //v2 = 12;  if you un commented this line
}
