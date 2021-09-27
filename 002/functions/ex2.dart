/**
 * function_name(param1,{param2= default_value}) { 
   //...... 
} 
 */

void main() {
  test_param(123);
  test_param(122, s1: 25);
}

void test_param(n1, {s1: 12}) {
  print(n1);
  print(s1);
}
