class Periodically {
  int patience = 1000;

  long lastTime;
  long originalTime;

  boolean state;
  boolean originalState;

  Periodically () {
    lastTime = millis ();
    originalTime = lastTime;
  }
  Periodically (int patience) {
    this.patience = patience;
    lastTime = millis ();
    originalTime = lastTime;
  }
  Periodically (int patience, boolean state) {
    this.state = state;
    originalState = state;
    
    this.patience = patience;
    lastTime = millis ();
    originalTime = lastTime;
  }

  void setPatience (int patience) {
    this.patience = patience;
  }
  void reset () {
    lastTime = millis ();
    state = originalState;
  }

  double elapsedTime () {
    return millis () - lastTime;
  }
  double elapsedOriginalTime () {
    return millis () - originalTime;
  }

  boolean getState () {
    itsTime ();
    return state;
  }

  boolean itsTime () {
    if (pastTime ()) {
      lastTime = millis ();
      state = !state;
      return true;
    }
    return false;
  }
  boolean pastTime () {
    return elapsedTime () > patience;
  }
  boolean pastOriginalTime () {
    return elapsedOriginalTime () > patience;
  }
  boolean pastHalfTime () {
    return elapsedTime () > patience/2.0;
  }
}


void setIntern () {  
  String  Dep[] = table.getStringColumn("DEPARTMENT");
  String Sem[] = table.getStringColumn("Semester");
  String Year[] = table.getStringColumn("SCHOOL YEAR");
  String Intern[] = table.getStringColumn("INTERNSHIP");

  for (int x = 0; x < Dep.length; x ++) {
    if (month()>6 && month() <12) {
      int rIndex = internTable.findRowIndex (Dep [x], "Departments");
      String year = internTable.getString (rIndex, 1);
      String semi = internTable.getString (rIndex, 2);
      if (Year[x].equals(year) && Sem[x].equals(semi)&& Intern[x].equals("0")) {
        table.setString (x, "INTERNSHIP", "1");
        saveTable (table, tablePath);
    }
  }
  }
}
