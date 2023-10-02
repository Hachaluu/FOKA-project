void monthlyReports(){
  
  String yearFilePath = dataPath ("") + "/" + year () + "/";
 
  monthlyTablePath = yearFilePath + monthsOfTheYear [month () - 1] + ".csv";

  File dir = new File (yearFilePath);
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
}

void saveState (String stat, String colName, float amount) {
  int rIndex = monthlyTable.findRowIndex (stat, 0);
  monthlyTable.setString (rIndex, colName, str (amount));
}
void savingReport () {
  
  saveState ("Breakfast", colName, BF);
  saveState ("Lunch", colName, LN);
  saveState ("Dinner", colName, DN);
  saveState ("Average", colName, avg );
  saveState ("Percentage", colName, percentage);
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
