/**
 * if (boolean_expression1) { 
    //statements if the expression1 evaluates to true 
  } 
  else if (boolean_expression2) { 
    //statements if the expression2 evaluates to true 
  } 
  else { 
    //statements if both expression1 and expression2 result to false 
  } 
 */
void main() {
  var num = 2;
  if (num > 0) {
    print("${num} is positive");
  } else if (num < 0) {
    print("${num} is negative");
  } else {
    print("${num} is neither positive nor negative");
  }
  // type checking
  print(num.runtimeType);
  if (num.runtimeType == int) {
    print("integer");
  } else {
    print("double");
  }
}
