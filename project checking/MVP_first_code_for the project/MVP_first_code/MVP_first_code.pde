import static javax.swing.JOptionPane.*;
String code = showInputDialog("Enter Your code please");

Table NAME = loadTable("C:/Users/Dell/Desktop/desktop/project/U Check/DATA_1.csv", "header");
boolean isstudent = false;
String checkedT = "0";
String checkedF = "1";
 
for (int c = 0; c < NAME.getRowCount(); c++) {

  if (code.equals(NAME.getString(c, "CODE"))) {
    isstudent = true;

    String cafe = NAME.getString(c, "CAFEE");
    int cafee = int (cafe);
    if (isstudent == true && cafee == 1) {
      println ("cafe user");
     
    if (checkedT.equals(NAME.getString(c, "22-AUG-23-BF"))) {
      println ("Can eat break fast");
    } else if (checkedF.equals(NAME.getString(c, "22-AUG-23-BF"))) {
      println ("You can't eat break fast");
    } else NAME.setString(c,"22-AUG-23-BF","1");
  }else println ("non cafe");
    break;
  }
}
//saveTable(NAME,"C:/Users/Dell/Desktop/desktop/project/U Check/DATA_1.csv");
