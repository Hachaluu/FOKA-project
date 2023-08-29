Table table;
String used = "1";
String intern = "2";
int row;
String tablePath = "C:/Users/user/Desktop/DATA_1.csv";
String breakfastTime;
String lunchTime;
String dinnerTime;

boolean isbreakfasttime;
boolean islunchtime;
boolean isdinnertime;

void setup () {
  size (144, 176);

  image = new ZXING4P ();

  movie = new Movie(this, ip);
  movie.loop ();

  //zxing = new ZXING4P();
}

void draw () {
  if ( movie!= null && movie.height != 0 && movie.width != 0) {
    image (movie, 0, 0);
    
    try {
      decodeQR (movie);
    } catch (Exception e) {
      println (e);
    }
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
boolean isINTERNSHIP (String used) {
  boolean INTERNSHIP = false;
  if (used.equals(table.getString(row, "INTERNSHIP"))) {
    INTERNSHIP = true;
  }
  return INTERNSHIP;
}
boolean isSpecialIntern(String intern) {
  boolean isSpecial = false;
  if (intern.equals(table.getString(row, "INTERNSHIP"))) {
    isSpecial = true;
  }
  return isSpecial;
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
