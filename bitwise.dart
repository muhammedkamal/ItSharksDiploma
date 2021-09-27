void main() {
  var a = 2; // Bit presentation 10
  var b = 3; // Bit presentation 11

  var result = (a & b);
  print("(a & b) => ${result}");
  result = (a | b);
  print("(a | b) => ${result}");
  result = (a ^ b);
  print("(a ^ b) => ${result}");

  result = (~b);
  print("(~b) => ${result}");

  result = (a << b);
  print("(a << b) => ${result}");

  result = (a >> b);
  print("(a >> b) => ${result}");
}
