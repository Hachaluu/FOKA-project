import java.time.LocalDate;

LocalDate thisSunday = LocalDate.parse ("2023-08-27");
LocalDate prevSunday = thisSunday.minusWeeks(1);

int avg = 7;
String one = "1";
int BF = 0;
int LN = 0;
int DN = 0;
Table table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2 .csv", "header");

String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

String days [] = new String [0];
try {
  for (int a = 0; a < 7; a ++) {
    prevSunday = prevSunday.plusDays (1);
    String monthStr = monthsOfTheYear [prevSunday.getMonthValue() - 1];
    String yearStr = str (prevSunday.getYear ());

    String date = prevSunday.getDayOfMonth () + "-" + monthStr + "-" + yearStr;
    days = append (days, date);
  }

  for (int a = 0; a < days.length; a ++) {
    String breakfastTime = days [a] + "-" + "BF";
    String lunchTime = days [a] + "-" + "LN"; 
    String dinnerTime = days [a] + "-" + "DN"; 

    String Breakfast [] = table.getStringColumn (breakfastTime );
    String Lunch [] = table.getStringColumn (lunchTime);
    String Dinner [] = table.getStringColumn (dinnerTime);

    for (int i = 0; i < Breakfast.length; i ++) {
      if (Breakfast [i].equals (one)) {
        BF ++;
      }
    }
    for (int i = 0; i < Lunch.length; i ++) {
      if (Lunch [i].equals (one)) {
        LN ++;
      }
    }
    for (int i = 0; i < Dinner.length; i ++) {
      if (Dinner [i].equals (one)) {
        DN ++;
      }
    }
  }

  println (BF, "Students have eaten Break fast in the last Week.");
  println (LN, "Students have eaten Lunch in the last Week.");
  println (DN, "Students have eaten Dinner in the last Week.");
  println ("***************************************************************");
  println ("In average",BF/avg, "Students have eaten Break fast in the last Week.");
  println ("In average",LN/avg, "Students have eaten Lunch in the last Week.");
  println ("In average",DN/avg, "Students have eaten Dinner in the last Week.");

} 
catch (Exception e ) {
  println (e);
}