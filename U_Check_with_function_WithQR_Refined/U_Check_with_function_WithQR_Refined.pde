import static javax.swing.JOptionPane.*;
import com.cage.zxing4p3.*;
ZXING4P zxing;
PImage QRCode;

Table table;
String used = "1";
int row;
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_1.csv";
String breakfastTime;
String lunchTime;
String dinnerTime;

boolean isbreakfasttime;
boolean islunchtime;
boolean isdinnertime;

String code;
String path;

void updateDateStamp () {
  breakfastTime = getDateStamp()+"-"+"BF";
  lunchTime = getDateStamp()+"-"+"LN";
  dinnerTime = getDateStamp()+"-"+"DN";
}

void setup () {
  zxing = new ZXING4P();
}

void draw () {
  if (path != null && !path.isEmpty()) {
    decodeQR (path);
    everything (code);
    food (used);

    path = "";
    code = "";
  }
}
void mouseReleased () {
  selectInput ("Insert a QR Code Image", "file");
}

void file (File f) {
  path = f.getAbsolutePath();
  println (f.getAbsolutePath());
}

void decodeQR (String path) {
  QRCode = loadImage (path);
  String decoded = zxing.decodeImage (true, QRCode);
  code = decoded;
}

void updateTime () {
  isbreakfasttime = hour() >= 6 && hour() <= 8;
  islunchtime = hour() >= 12 && hour() <= 14;
  isdinnertime = hour() >= 18 && hour() <= 20;
}

void everything (String code) {  
  updateTime ();
  updateDateStamp ();

  table = loadTable(tablePath, "header");

  boolean foundColumn = false;
  String whatTime = null;

  if (isbreakfasttime) whatTime = breakfastTime;
  else if (islunchtime) whatTime = lunchTime;
  else if (isdinnertime) whatTime = dinnerTime;

  if (whatTime != null) {
    try {
      table.getColumnIndex (whatTime);
      foundColumn = true;
    } 
    catch (Exception e) {
    }

    if (!foundColumn) {
      table.addColumn(whatTime);
      saveTable (table, tablePath);
    }
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
}
void food (String used ) {
  if (isbreakfasttime == true) {
    boolean hadBREAKFAST = breakfast (used); 
    //println ("Had breakfast: ", hadBREAKFAST);
    if (hadBREAKFAST == false) {
      println ("Can eat break fast");
      table.setString (row, breakfastTime, "1");
      saveTable (table, tablePath);
      return;
    } else {
      println ("You have eaten breakfast");
    }
  } else if (islunchtime == true) {
    boolean LUNCH = Lunch (used); 
    if ( LUNCH == false) {
      println ("Can eat LUNCH"); 
      table.setString (row, lunchTime, "1");
      saveTable (table, tablePath);
      return;
    } else println ("You have eaten lunch");
  } else if (isdinnertime == true ) {
    boolean DINNER = dinner (used); 
    if ( DINNER == false) {
      println ("Can eat DINNER"); 
      table.setString (row, dinnerTime, "1");
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
  if (used.equals(table.getString(row, breakfastTime))) {
    breakfastF = true;
  }
  return breakfastF;
}
boolean Lunch (String used) {
  boolean lunchf = false; 
  if (used.equals(table.getString(row, lunchTime))) {
    lunchf = true;
  }
  return lunchf;
}
boolean dinner (String used) {
  boolean dinnerf = false; 
  if (used.equals(table.getString(row, dinnerTime))) {
    dinnerf = true;
  }
  return dinnerf;
}
