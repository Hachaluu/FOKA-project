
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
  table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2 .csv", "header");
  updateDateStamp(); 
  today();
}
void today () {
     String Breakfast [] = table.getStringColumn (breakfastTime);
    for (int i = 0; i < Breakfast.length; i ++) {
      if (Breakfast [i].equals (one)) {
        BF ++;
      }
    }
    println (BF, "Students have eaten Break fast Today.");
  //else println ("There is no column named " + breakfastTime);
  String Lunch [] = table.getStringColumn (lunchTime);
  for (int i = 0; i < Lunch.length; i ++) {
    if (Lunch [i].equals (one)) {
      LN ++;
    }
  }
  println (LN, "Students have eaten Lunch Today.");
  String Dinner [] = table.getStringColumn (dinnerTime);

  for (int i = 0; i < Dinner.length; i ++) {
    if (Dinner [i].equals (one)) {
      DN ++;
    }
  }
  println (DN, "Students have eaten Dinner Today");
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
