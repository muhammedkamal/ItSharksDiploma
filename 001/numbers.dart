/**
 * int var_name;      // declares an integer variable 
 * double var_name;   // declares a double variable 
 */
void main() {
  // that will work
  int num1 = 10;
  // num1 = 20.5; // reassigning a value
  double num2 = 10.50;
  print(num1);
  print(num2);

  // that also would work
  print(num.parse('12'));
  print(num.parse('10.91'));

  // that aslo would work
  String num3 = "211";
  print(int.parse(num3));

  // that will not work
  // print(num.parse('12A')); // run time error if you uncommented that

  // what if I want only 3 numbers after decimal point ??
  // easy besy
  double oneThird = 1 / 3;
  print(oneThird);
  print(oneThird.toStringAsFixed(3));
}
