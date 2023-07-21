import 'dart.io';
void main (){
print("ENTER THE  operation")
String oper = stdin.readLineSync();
String num1 = int.parse(stdin.readLineSync());
String num2 = int.parse(stdin.readLineSync());
  for(oper !=q){
  switch(oper){
      case"+";
      p = num1+num2;
      print("$p");
      break;
      case"-";
      z = num1-num2;
      print("$z");
      break;
      case"/";
      d = num1/num2;
      print("$d");
      break;
      case"*";
      m = num1*num2;
      print("$m");
      break;
  }
  }
}
