void main() {
  var num1 = 5;
  var num2 = 9;
  var res = num1 > num2;
  print('num1 greater than num2 ::  ' + res.toString());

  res = num1 < num2;
  print('num1 lesser than  num2 ::  ' + res.toString());

  res = num1 >= num2;
  print('num1 greater than or equal to num2 ::  ' + res.toString());

  res = num1 <= num2;
  print('num1 lesser than or equal to num2  ::  ' + res.toString());

  res = num1 != num2;
  print('num1 not equal to num2 ::  ' + res.toString());

  res = num1 == num2;
  print('num1 equal to num2 ::  ' + res.toString());
}
