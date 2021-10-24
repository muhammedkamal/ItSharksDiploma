/**
 * while (expression) {
    Statement(s) to be executed if expression is true  
  }
 */
void main() {
  var num = 5;
  var factorial = 1;

  while (num >= 1) {
    factorial *= num;
    num--;
  }
  print("The factorial  is ${factorial}");
}
