void main() {
  print(factorial(6));
}
//5!= 5*4!
//4!= 4*3*2*1 = 4*3!

factorial(number) {
  if (number <= 1) {
    // termination case
    return 1;
  } else {
    return (number * factorial(number - 1));
    // function invokes itself
  }
}
