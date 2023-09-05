Table table;
String used = "1";
String intern = "2";
int row;
String tablePath =  "C:/Users/Dell/Desktop/desktop/project/project/DATA_1.csv";
String breakfastTime;
String lunchTime;
String dinnerTime;

boolean isbreakfasttime;
boolean islunchtime;
boolean isdinnertime;

void setup () {
  size (300, 176);

  println (1, millis ());
  image = new ZXING4P ();
  println (2, millis ());
  movie = new Movie(this, ip);
  println (3, millis ());
  movie.loop ();
  image_two = new ZXING4P ();
  println (4, millis ());
  movie_two = new Movie(this, ip_two);
  println (5, millis ());
  movie_two.loop ();
  println (6, millis ());

  //zxing = new ZXING4P();
}

void draw () {
  if ( movie!= null && movie.height != 0 && movie.width != 0) {
    image (movie, 0, 0);

    try {
      decodeQR (movie);
    } 
    catch (Exception e) {
      println (e);
    }
  }
  if ( movie_two!= null && movie_two.height != 0 && movie_two.width != 0) {
    image (movie_two, 144 + 6, 0);

    try {
      decodeQR_two (movie_two);
    } 
    catch (Exception e) {
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
