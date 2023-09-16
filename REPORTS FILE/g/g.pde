Table table;
String one = "1";
table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2 .csv", "header");
int BF = 0;
int LN = 0;
int DN = 0;

void setup() {
  updateDateStamp(); 


  String Breakfast [] = table.getStringColumn (breakfastTime);
  String Lunch [] = table.getStringColumn (lunchTime);
  String Dinner [] = table.getStringColumn (dinnerTime);

  for (int i = 0; i < Breakfast.length; i ++) {
    if (Breakfast [i].equals (one)) {
      BF ++;
    }
  }
  for (int i = 0; i < Lunch.length; i ++) {
    if (Breakfast [i].equals (one)) {
      LN ++;
    }
  }
  for (int i = 0; i < Dinner.length; i ++) {
    if (Breakfast [i].equals (one)) {
      DN ++;
    }
  }
}
println (BF, "Students have eaten Break fast.");
println (LN, "Students have eaten Lunch.");
println (DN, "Students have eaten Dinner");
void updateDateStamp () {
  breakfastTime = getDateStamp()+"-"+"BF";
  lunchTime = getDateStamp()+"-"+"LN";   
  dinnerTime = getDateStamp()+"-"+"DN";
}

String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return day () + "-" + monthsOfTheYear [month () - 1] + "-" + year ();
}
