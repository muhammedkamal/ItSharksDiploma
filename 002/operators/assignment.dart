void main() {
  var a = 12;
  var b = 3;

  a += b;
  print("a+=b : ${a}");

  a = 12;
  b = 13;
  a -= b;
  print("a-=b : ${a}");

  a = 12;
  b = 13;
  a *= b;
  print("a*=b' : ${a}");

  b = 13;
  double c = 12;
  c /= b;
  print("c/=b : ${c}");

  a = 12;
  b = 13;
  a %= b;
  print("a%=b : ${a}");
}
