String breakfastTime;
String lunchTime;
String dinnerTime;

String one = "1";

int BF = 0;
int LN = 0;
int DN = 0;

int cafe_users = 0;
int cIndex;
void setup() {
  Table table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv", "header");
  updateDateStamp(); 
  totalcafeusers();

cIndex = findColIndex (table, breakfastTime);
  if (cIndex != -1) {
   String Breakfast [] = table.getStringColumn (breakfastTime);
 
  for (int i = 0; i < Breakfast.length; i ++) {
    if (Breakfast [i].equals (one)) {
      BF ++;
    }
  }
  }
  cIndex = findColIndex (table, lunchTime);
  if (cIndex != -1) {
  String Lunch [] = table.getStringColumn (lunchTime);
 
    for (int i = 0; i < Lunch.length; i ++) {
    if (Lunch [i].equals (one)) {
      LN ++;
    }
  }
  }
  cIndex = findColIndex (table, dinnerTime);
  if (cIndex != -1) {
      String Dinner [] = table.getStringColumn (dinnerTime);

  for (int i = 0; i < Dinner.length; i ++) {
    if (Dinner [i].equals (one)) {
      DN ++;
    }
  }
  }
  println ("************************************************************");
  println ("From",cafe_users,"students",(BF*100)/cafe_users,"%", "Students have eaten Break fast Today.");
  println ("From",cafe_users,"students",(LN*100)/cafe_users,"%","Students have eaten Lunch Today."); 
  println ("From",cafe_users,"students",(DN*100)/cafe_users,"%","Students have eaten Dinner Today");
   println ("************************************************************");
}

void updateDateStamp () {
  breakfastTime = getDateStamp()+"-"+"BF";
  lunchTime = getDateStamp()+"-"+"LN";   
  dinnerTime = getDateStamp()+"-"+"DN";
}

String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return day () + "-" + monthsOfTheYear [month () - 1] + "-" + year ();
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
