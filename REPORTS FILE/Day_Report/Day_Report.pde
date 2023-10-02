String dataPath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

String daysofTheMonth [] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14","15","16","17", "18", "19", "20", "21", "22","23", "24", "25", "26", "27", "28", "29", "30", "31"};

String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

String stat[] = {"Stat", "Breakfast", "Lunch", "Dinner", "Average", "Percentage"};
String monthlyTablePath;

Table data, monthlyTable;
String colName ;

void setup () {
  String monthFilePath = dataPath ("") + "/"+year() + "/" + monthsOfTheYear [month () - 1] + "/";
 
  monthlyTablePath = monthFilePath + daysofTheMonth [day () - 1] + ".csv";

  println (monthlyTablePath);

  File dir = new File (monthFilePath);  
  if (!dir.exists ()) {
    dir.mkdirs();
  }
  
  File file = new File (monthlyTablePath);
  if (!file.exists ()) {
    createTemplate();
  }

  // Creating column with day
  monthlyTable = loadTable (monthlyTablePath, "header");
  colName = str (day ());
  if (!hasColumnName (colName)) {
    monthlyTable.addColumn(colName);
  }
  updateDateStamp(); 
  totalcafeusers();
  today();
  savingReport ();
  saveTable (monthlyTable, monthlyTablePath);
  //println (avg);
}

void saveStat (String stat, String colName, float amount) {
  int rIndex = monthlyTable.findRowIndex (stat, 0);
  monthlyTable.setString (rIndex, colName, str (amount));
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
  saveTable (data, monthlyTablePath);
}

boolean hasColumnName (String columnName) {
  try {
    monthlyTable.getColumnIndex (columnName);
    return true;
  } 
  catch (Exception e) {
    return false;
  }
}
