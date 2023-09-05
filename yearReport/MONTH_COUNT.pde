import java.time.LocalDate;

LocalDate thisMonth = LocalDate.parse ("2023-08-01");
LocalDate prevMonth = thisMonth.minusMonths(1);

int avg = month();
String one = "1";
int BF = 0;
int LN = 0;
int DN = 0;
int totalcount;
int averagecount;
int percentagecount;
int cafeusers;

String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

String  days[] = new String [0];


void months () {
  try {
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
      totalcount = BF + LN + DN;
      averagecount = (BF + LN + DN)/3;
      percentagecount = (((BF + LN + DN))/cafeusers);
    }
  } 
  catch (Exception e ) {
    println (e);
  }
}

void cafecount () {
  String CAFE [] = table.getStringColumn ("CAFEE");
  for (int x = 0; x < CAFE.length; x ++) {
    if (CAFE [x].equals("1")) {
      cafeusers ++;
    }
  }
}



int minB = 0, maxB = 0;
void countbf() {
  String bfs [] = septable.getStringRow (0);

  for (int a = 1; a < bfs.length; a ++) {
    String countStr = bfs [a];
    int count = int (countStr);

    if (a == 1) {
      minB = count;
      maxB = count;
    }

    maxB = max (maxB, count);
  }
}

int maxL = 0, minL = 0;
void countln() {
  String lns [] = septable.getStringRow (1);

  for (int a = 1; a < lns.length; a ++) {
    String countStr = lns [a];
    int countL = int (countStr);

    if (a == 1) {
      minL = countL;
      maxL = countL;
    }

    maxL = max (maxL, countL);
  }
}
int maxD = 0, minD = 0;
void countdn() {
String lns [] = septable.getStringRow (2);

for (int a = 1; a < lns.length; a ++) {
  String countStr = lns [a];
  int countD = int (countStr);
  
  if (a == 1) {
    minD = countD;
    maxD = countD;
  }
  
  maxD = max (maxD, countD);
  
}
}
