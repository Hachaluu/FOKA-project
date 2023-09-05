import java.time.LocalDate;

LocalDate thisMonth = LocalDate.parse ("2023-08-01");
LocalDate prevMonth = thisMonth.minusMonths(1);

int avg = 31;
String one = "1";
int BF = 0;
int LN = 0;
int DN = 0;
Table table = loadTable("C:/Users/Dell/Desktop/desktop/project/project/DATA_2 .csv", "header");


int cafe_users = 0;

String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

String  days[] = new String [0];

try {
  String cafe [] = table.getStringColumn("CAFEE");
  for (int x  = 0; x < cafe.length; x ++) {
    if (cafe[x].equals("1"))
      cafe_users ++;
  }
  for (int a = 0; a < 31; a ++) {
    prevMonth = prevMonth.minusDays (1);

    String monthStr = monthsOfTheYear [prevMonth.getMonthValue() - 1];
    String yearStr = str (prevMonth.getYear ());

    String date = prevMonth.getDayOfMonth () + "-" + monthStr + "-" + yearStr;
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
  println ("***********************************************************************");
  println ("From", cafe_users, "students", (BF/avg*100)/cafe_users, "%", "Students have eaten Break fast in the last Month.");
  println ("From", cafe_users, "students", (LN/avg*100)/cafe_users, "%", "Students have eaten Lunch in the last Month.");
  println ("From", cafe_users, "students", (DN/avg*100)/cafe_users, "%", "Students have eaten Dinner in the last Month.");
  println ("***********************************************************************");
} 
catch (Exception e ) {
  println (e);
}
