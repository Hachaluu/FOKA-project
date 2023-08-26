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

void setup () {
  zxing = new ZXING4P();
}

void draw () {
  if (path != null && !path.isEmpty()) {
    decodeQR (path);
    everything (code);
    
    path = "";
    code = "";
  }
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
