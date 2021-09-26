void main() {
  // that will work
  List<int> list = [1, 2, 3];
  print(list);
  print(list[0]);
  print(list.elementAt(1));
  list[1] = 22;
  print(list);
  list.remove(22);
  print(list);

  // that will cause error
  //list.add("22"); //if you un comment that
}
