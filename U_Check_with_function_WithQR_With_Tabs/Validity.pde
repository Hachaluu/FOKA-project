void everything (String code) {  
  updateTime ();
  updateDateStamp ();

  table = loadTable(tablePath, "header");

  boolean foundColumn = false;
  String whatTime = null;

  if (isbreakfasttime) whatTime = breakfastTime;
  else if (islunchtime) whatTime = lunchTime;
  else if (isdinnertime) whatTime = dinnerTime;

  if (whatTime != null) {
    try {
      table.getColumnIndex (whatTime);
      foundColumn = true;
    } 
    catch (Exception e) {
    }

    if (!foundColumn) {
      table.addColumn(breakfastTime);
      table.addColumn(lunchTime );
      table.addColumn(dinnerTime);
      saveTable (table, tablePath);
    }
  }

  boolean isstudent = isValidCode (code);
  if (isstudent == false) {
    println ("invalid code"); 
    return;
  } else println ("valid"); 

  row = table.findRowIndex (code, 0); 

  boolean iscafee = iscafe(used); 
  if (iscafee == false) {
    println ("non cafe"); 
    return;
  } else println ("cafe user");
  
  food (used);
}
