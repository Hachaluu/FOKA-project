String dataPath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

Table septable ;

String stats [] = { "Total count", "BF count", "LN count", "DN count", "BF Max", "LN Max", "DN Max", "Average", "Maximum", "Minimum", "Percentage"};

Table table, yearlyTable;
String colName =str (month());

String YearlyReport;
void setup () {
  septable = loadTable ("C:/Users/Dell/Desktop/desktop/project/project/REPORTS FILE/repo/repo/data/2023/Sep.csv", "header");

  table =  loadTable(dataPath, "header");

  String YearFile = dataPath ("") + "/" + year () + "/";
  YearlyReport = YearFile + year () + ".csv";

  File year = new File (YearFile);
  if (!year.exists()) {
    year.mkdirs();
  }
  File file = new File (YearlyReport);
  if (!file.exists()) {
    creatYear();
  }

  yearlyTable = loadTable (YearlyReport, "header");
  if (!hasColumnName (colName)) {
    yearlyTable.addColumn(colName);
  }

  cafecount();
  months();
  countbf();
  countln();
  countdn();
  savingRepo();
  saveTable (yearlyTable, YearlyReport);
}

void creatYear () {
  Table table = new Table();

  table.addColumn("Stats");
  table.addColumn(getDateStamp());

  for (int x = 0; x < stats.length; x ++ ) {
    TableRow newRow = table.addRow();
    newRow.setString(0, stats[x]);
  }

  saveTable (table, YearlyReport);
}

void saveStat (String stats, String colName, float amount) {
  int rIndex = yearlyTable.findRowIndex(stats, 0);
  println (stats, colName, amount);
  yearlyTable.setString (rIndex, colName, str (amount));
}

void savingRepo () {
  saveStat ("Total count", colName, totalcount); 
  saveStat ("BF count", colName, BF); 
  saveStat ("LN count", colName, LN); 
  saveStat ("DN count", colName, DN); 
  saveStat ("BF Max", colName, maxB); 
  saveStat ("LN Max", colName, maxL);
  saveStat ("DN Max", colName, maxD); 
  saveStat ("Average", colName, averagecount); 
  //saveStat ("Maximum", colName, 0); 
  //saveStat ("Minimum", colName, 0);
  saveStat ("Percentage", colName, percentagecount);
}


boolean hasColumnName (String columnName) {
  try {
    yearlyTable.getColumnIndex (columnName);
    return true;
  } 
  catch (Exception e) {
    return false;
  }
}

String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return  monthsOfTheYear [month () - 1] ;
}
