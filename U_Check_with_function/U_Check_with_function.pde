import static javax.swing.JOptionPane.*;
Table NAME;
String used = "1";
int row;
boolean isbreakfasttime = false;
boolean islunchtime = false;
boolean isdinnertime = false;

void draw () {
  String code = showInputDialog("Enter Your code please");

  NAME = loadTable("C:/Users/Dell/Desktop/desktop/project/U Check/DATA.csv", "header");
  boolean isstudent = isValidCode (code);
    if (isstudent == false) {
    println ("invalid code"); 
      return;
  } else println ("valid"); 
  
    row = NAME.findRowIndex (code, 0); 
    boolean iscafee = iscafe(used); 
    if (iscafee == false) {
    println ("non cafe"); 
      return;
  } else println ("cafe user"); 

if (isbreakfasttime == true){
    boolean BREAKFAST = breakfast (used); 
    if (BREAKFAST == false) {
    println ("Can eat BREAK FAST"); 
      return;
  } else println ("Can't eat break fast now");
}else if (islunchtime == true){
  boolean LUNCH = Lunch (used); 
    if ( LUNCH == false) {
    println ("Can eat LUNCH"); 
      return;
  } else println ("Can't eat LUNCH now");
}else if (isdinnertime == true ){boolean DINNER = dinner (used); 
    if ( DINNER == false) {
    println ("Can eat DINNER"); 
      return;
  } else println ("Can't eat DINNER now");
}
else print ("The time for a meal has passed");
}
boolean isValidCode (String code) {
  boolean foundCode = false; 
    for (int c = 0; c < NAME.getRowCount(); c++) {
    if (code.equals(NAME.getString(c, "CODE"))) {
      foundCode = true; 

        break;
    }
  }

  return foundCode;
}
boolean iscafe (String used) {
  boolean cafe = false; 
    if (used.equals(NAME.getString(row, "CAFEE"))) {
    cafe = true;
  }
  return cafe;
}
boolean breakfast (String used) {
  boolean breakfastF = false; 
    if (used.equals(NAME.getString(row, "22-AUG-23-breakfast"))) {
    breakfastF = true;
  }
  return breakfastF;
}
boolean Lunch (String used) {
  boolean lunchf = false; 
    if (used.equals(NAME.getString(row, "22-AUG-23-Lunch"))) {
    lunchf = true;
  }
  return lunchf;
}
  boolean dinner (String used) {
  boolean dinnerf = false; 
    if (used.equals(NAME.getString(row, "22-AUG-23-dinner"))) {
    dinnerf = true;
  }
  return dinnerf;
}
