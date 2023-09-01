void food (String used ) {
  if (isbreakfasttime == true) {
    boolean hadBREAKFAST = breakfast (used); 
     if (hadBREAKFAST == false) {
      println ("Can eat break fast");
      table.setString (row, breakfastTime, "1");
      saveTable (table, tablePath);
      return;
    } else {
      println ("You have eaten breakfast");
    }
  } else if (islunchtime == true) {
    boolean LUNCH = Lunch (used); 
    if ( LUNCH == false) {
      println ("Can eat LUNCH"); 
      table.setString (row, lunchTime, "1");
      saveTable (table, tablePath);
      return;
    } else println ("You have eaten lunch");
  } else if (isdinnertime == true ) {
    boolean DINNER = dinner (used); 
    if ( DINNER == false) {
      println ("Can eat DINNER"); 
      table.setString (row, dinnerTime, "1");
      saveTable (table, tablePath);
      return;
    } else println ("You have eaten Dinner");
  } else  println ("The time for a meal has passed");
}
