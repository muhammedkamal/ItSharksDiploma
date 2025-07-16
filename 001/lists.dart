void main() {
  // that will work
  List<int> list = [1, 2, 3];
  print(list);
  print(list[0]);
  print(list.elementAt(1));
  list[1] = 22;
  list.add(33);
  list.add(22);
  print(list);
  // list[4] = 44; // that will cause an error if you uncommented this line
  print(list);
  list.remove(22); // that will not cause an error
  print(list);

  // that will cause error
  //list.add("22"); //if you un comment that
}
