String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

class DReport {
  String dataPath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

  String daysofTheMonth [] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"};

  String stat[] = {"Stat", "Breakfast", "Lunch", "Dinner", "Average", "Percentage"};
  String dailyTablePath;

  Table data, dailyTable;
  String colName ;

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

  void generate () {
    println ("Generating Daily Report");
    String monthFilePath = "C:/Users/Dell/Desktop/desktop/project/project/navigation_Sep22_Morning_7_30/data" + "/"+year() + "/" + monthsOfTheYear [month () - 1] + "/";

    dailyTablePath = monthFilePath + daysofTheMonth [day () - 1] + ".csv";

    println ("Saving to path:");
    println (dailyTablePath);

    File dir = new File (monthFilePath);  
    if (!dir.exists ()) {
      dir.mkdirs();
    }
    
    println ("Daily Table Path: ", dailyTablePath);

    File file = new File (dailyTablePath);
    if (!file.exists ()) {
      createTemplate();
    }

    // Creating column with day
    dailyTable = loadTable (dailyTablePath, "header");
    println (dailyTablePath);
    colName = str (day ());
    if (!hasColumnName (colName)) {
      dailyTable.addColumn(colName);
    }
    updateDateStamp(); 
    totalcafeusers();
    today();
    savingReport ();
    saveTable (dailyTable, dailyTablePath);
    //println (avg);
  }


  void saveStat (String stat, String colName, float amount) {
    int rIndex = dailyTable.findRowIndex (stat, 0);
    dailyTable.setString (rIndex, colName, str (amount));
  }
  void savingReport () {

    saveStat ("Breakfast", colName, BF);
    saveStat ("Lunch", colName, LN);
    saveStat ("Dinner", colName, DN);
    saveStat ("Average", colName, avg );
    saveStat ("Percentage", colName, percentage);
  }
  void createTemplate () {
    data = new Table ();
    for (int i = 0; i < stat.length; i ++) {
      TableRow newRow = data.addRow ();
      newRow.setString (0, stat[i]);
    }
    println ("Saving Daily Table");
    saveTable (data, dailyTablePath);
  }

  boolean hasColumnName (String columnName) {
    try {
      dailyTable.getColumnIndex (columnName);
      return true;
    } 
    catch (Exception e) {
      return false;
    }
  }
}

String [] getDailyReport (String year, String month, String day) {
  String tablePath = "data/" + year + "/" +month+ "/" + day + ".csv";
  println (tablePath,"here");
  Table table = loadTable (tablePath, "header");
  
  String dayR [] = table.getStringColumn (day);
  float total = float (dayR [0]) + float (dayR [1]) + float (dayR [2]);
  String minMeal = "";
  String maxMeal = "";

  String monthdetail [] = new String [] {
    month + " " + day + "," + year, 
    dayR [0], 
    dayR [1], 
    dayR [2], 
    str (total), 
    "- | - | -", 
    "-", 
    "-", 
    "- | - | -"
  };

  return monthdetail;
}
