/**
 String  variable_name = 'value'  

  OR  

  String  variable_name = ''value''  

  OR  

  String  variable_name = '''line1 
  line2'''  

  OR  

  String  variable_name= ''''''line1 
  line2''''''
 */

void main() {
  String str1 = 'this is a single line string';
  String str2 = "this is a single line string";
  String str3 = '''this is a multiline
   line string''';
  String str4 = """this is a multiline
   line string""";

  print(str1);
  print(str2);
  print(str3);
  print(str4);
  int num = 10;
  // The operator plus (+) is a commonly used mechanism to concatenate / interpolate strings.
  String str5 = "hello";
  String str6 = "world";
  String res = str5 + str6;

  print("The concatenated string : $res and number is ${num + 3} ");

  //sub string
  print(str5.substring(0, 1)); // that would print only h
  print(res.substring(3)); // that would print from the forth char to the end loworld
}
