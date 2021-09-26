/**
  bool var_name = true;  
  OR  
  bool var_name = false 
 */

void main() {
  // that will work
  bool test;
  test = 12 > 5;
  print(test);

  // that ccauses an error because string is not a bool

  var str = 'abc';
  /* if(str) { 
      print('String is not empty'); 
   } else { 
      print('Empty String'); 
   } */
}
