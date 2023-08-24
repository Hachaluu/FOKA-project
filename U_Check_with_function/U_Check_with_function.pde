  import static javax.swing.JOptionPane.*;
Table table;
//int date = day();
//String Date = str (day());
String used = "1";
int row;
boolean isbreakfasttime = hour() >= 6 && hour() <= 8;
boolean islunchtime = hour() >= 12 && hour() <= 14;
boolean isdinnertime = hour() >= 18 && hour() <= 20;
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_1.csv";


void draw () {
  table = loadTable(tablePath, "header");
  getDateStamp();
  boolean foundColumn = false;
  
  try {
    table.getColumnIndex (getDateStamp());
    foundColumn = true;
  } catch (Exception e) {
  }
  
  String code = showInputDialog("Enter Your code please");
  
  if (!foundColumn) {
    table.addColumn(getDateStamp());
    saveTable (table, tablePath);
  }

  boolean isstudent = isValidCode (code);
  if (isstudent == false) {
    println ("invalid code"); 
    return;
  } else println ("valid"); 

  row = table.findRowIndex (code, 0); 

  boolean iscafee = iscafe(used); 
  if (iscafee == false) {
    println ("non cafe"); 
    return;
  } else println ("cafe user");

  if (isbreakfasttime == true) {
    boolean hadBREAKFAST = breakfast (used); 
    //println ("Had breakfast: ", hadBREAKFAST);
    if (hadBREAKFAST == false) {
      println ("Can eat break fast");
      table.setString (row, getDateStamp(), "1");
      saveTable (table, tablePath);
      return;
    } else {
      println ("You have eaten breakfast");
    }
  } else if (islunchtime == true) {
    boolean LUNCH = Lunch (used); 
    if ( LUNCH == false) {
      println ("Can eat LUNCH"); 
      table.setString (row, getDateStamp(), "1");
      saveTable (table, tablePath);
      return;
    } else println ("You have eaten lunch");
  } else if (isdinnertime == true ) {
    boolean DINNER = dinner (used); 
    if ( DINNER == false) {
      println ("Can eat DINNER"); 
      table.setString (row, getDateStamp(), "1");
      saveTable (table, tablePath);
      return;
    } else println ("You have eaten Dinner");
  } else  println ("The time for a meal has passed");
}
String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return day () + "-" + monthsOfTheYear [month () - 1] + "-" + year ();
}

boolean isValidCode (String code) {
  boolean foundCode = false; 
  for (int c = 0; c < table.getRowCount(); c++) {
    if (code.equals(table.getString(c, "CODE"))) {
      foundCode = true; 

      break;
    }
  }

  return foundCode;
}
boolean iscafe (String used) {
  boolean cafe = false; 
  if (used.equals(table.getString(row, "CAFEE"))) {
    cafe = true;
  }
  return cafe;
}
boolean breakfast (String used) {
  boolean breakfastF = false; 
  if (used.equals(table.getString(row, getDateStamp()))) {
    breakfastF = true;
  }
  return breakfastF;
}
boolean Lunch (String used) {
  boolean lunchf = false; 
  if (used.equals(table.getString(row, getDateStamp()))) {
    lunchf = true;
  }
  return lunchf;
}
boolean dinner (String used) {
  boolean dinnerf = false; 
  if (used.equals(table.getString(row, getDateStamp()))) {
    dinnerf = true;
  }
  return dinnerf;
}
