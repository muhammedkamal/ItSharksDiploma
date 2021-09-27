/**
 * for (variablename in object){  
    statement or block to execute  
  }
 */
void main() {
  var obj = [12, 13, 14];

  for (var prop in obj) {
    print(prop);
  }
}
