
String breakfastTime;
String lunchTime;
String dinnerTime;
String one = "1";

float avg;
float percentage;
int BF = 0;
int LN = 0;
int DN = 0;

int cafe_users ;
int cIndex ;
void today () {

  Table table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv", "header");
  cIndex = findColIndex (table, breakfastTime);
  if (cIndex != -1) {
    String Breakfast [] = table.getStringColumn (breakfastTime);
    for (int i = 0; i < Breakfast.length; i ++) {
      if (Breakfast [i].equals (one)) {
        BF ++;
      }
    }
  }
  //println (BF, "Students have eaten Break fast Today.");
  //else println ("There is no column named " + breakfastTime);
  cIndex = findColIndex (table, lunchTime);
  if (cIndex != -1) {
    String Lunch [] = table.getStringColumn (lunchTime);
    for (int i = 0; i < Lunch.length; i ++) {
      if (Lunch [i].equals (one)) {
        LN ++;
      }
    }
  }
  //  println (LN, "Students have eaten Lunch Today.");

  cIndex = findColIndex(table, dinnerTime);
  if (cIndex != -1) {
    String Dinner [] = table.getStringColumn (dinnerTime);

    for (int i = 0; i < Dinner.length; i ++) {
      if (Dinner [i].equals (one)) {
        DN ++;
      }
    }
  }
  // println (D "Students have eaten Dinner Today");
  avg = (BF + LN + DN)/3;
  percentage = (avg *100)/cafe_users;
}

void updateDateStamp () {
  breakfastTime = getDateStamp()+"-"+"BF";
  lunchTime = getDateStamp()+"-"+"LN";   
  dinnerTime = getDateStamp()+"-"+"DN";
}

String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return day ()  + "-" + monthsOfTheYear [month () - 1] + "-" + year ();
}

int totalcafeusers () {
  Table table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv", "header");

  String cafe [] = table.getStringColumn("CAFEE");
  for (int x  = 0; x < cafe.length; x ++) {
    if (cafe[x].equals("1"))    
      cafe_users ++;
  }
  return cafe_users;
}


int findColIndex (Table table, String colName) {
  try {
    int cIndex = table.getColumnIndex (colName);
    return cIndex;
  } 
  catch (Exception e) {
    return -1;
  }
}
