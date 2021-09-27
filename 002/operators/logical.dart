void main() {
  var a = 10;
  var b = 12;
  var res = (a < b) && (b > 10);
  print(res);
  res = (a > b) || (b < 10);

  print(res);
  var res1 = !(a == b);
  print(res1);
}
