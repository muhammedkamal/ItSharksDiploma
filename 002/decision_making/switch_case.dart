/**
 * switch(variable_expression) { 
    case constant_expr1: { 
        // statements; 
    } 
    break; 
    
    case constant_expr2: { 
        //statements; 
    } 
    break; 
        
    default: { 
        //statements;  
    }
    break; 
  }
 */
void main() {
  var grade = "A";
  switch (grade) {
    case "A":
      {
        print("Excellent");
      }
      break;

    case "B":
      {
        print("Good");
      }
      break;

    case "C":
      {
        print("Fair");
      }
      break;

    case "D":
      {
        print("Poor");
      }
      break;

    default:
      {
        print("Invalid choice");
      }
      break;
  }
}
