
String breakfastTime;
String lunchTime;
String dinnerTime;
Table table;
String one = "1";
//loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2 .csv", "header");
int BF = 0;
int LN = 0;
int DN = 0;

void setup() {
  table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv", "header");
  updateDateStamp(); 
  today();
}
int cIndex ;
void today () {
  cIndex = findColIndex (table, breakfastTime);
  if (cIndex != -1) {
    String Breakfast [] = table.getStringColumn (breakfastTime);
    for (int i = 0; i < Breakfast.length; i ++) {
      if (Breakfast [i].equals (one)) {
        BF ++;
      }
    }

    println (BF, "Students have eaten Break fast Today.");
  }else println("No one have eaten Break Fast");
  //else println ("There is no column named " + breakfastTime);
  cIndex = findColIndex (table, lunchTime);
  if (cIndex != -1) {
    String Lunch [] = table.getStringColumn (lunchTime);
    for (int i = 0; i < Lunch.length; i ++) {
      if (Lunch [i].equals (one)) {
        LN ++;
      }
    }
    println (LN, "Students have eaten Lunch Today.");
  }else println("No one have eaten Lunch");
  cIndex = findColIndex (table, dinnerTime);
    if (cIndex != -1) {
    String Dinner [] = table.getStringColumn (dinnerTime);

    for (int i = 0; i < Dinner.length; i ++) {
      if (Dinner [i].equals (one)) {
        DN ++;
      }
    }
    println (DN, "Students have eaten Dinner Today");
  }else println("No one have eaten Dinner");
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
int findColIndex (Table table, String colName) {
  try {
    int cIndex = table.getColumnIndex (colName);
    return cIndex;
  } 
  catch (Exception e) {
    return -1;
  }
}
