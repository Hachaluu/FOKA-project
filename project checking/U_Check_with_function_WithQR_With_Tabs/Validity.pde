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
  for (int c = 0; c < table.getRowCount(); c++) {
    if (code.equals(table.getString (c, "CODE"))) {
      println ("NAME: "+table.getString(c, "NAME"));
    }
  }

  row = table.findRowIndex (code, 0); 

  boolean iscafee = iscafe(used); 
  boolean ISINTERNSHIP = isINTERNSHIP (used);
  boolean SpecialIntern = isSpecialIntern (intern);
  if (iscafee == false) {
    println ("Non cafe"); 
    return;
  } else if (iscafee == true ) {
    println ("Cafe user");
    if (ISINTERNSHIP == false) {
      println ("You are not intern student");
    } else if (ISINTERNSHIP == true) {
      println ("You are normal intern student so you are not allowed to access the cafe");
      return;
    } else if (SpecialIntern == true) {
      println ("You are special intern student.");
      return;
    }
    food (used);
  }
}
