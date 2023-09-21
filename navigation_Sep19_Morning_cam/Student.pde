class Student {
  String code = "";
  String INTERNSHIP_STATES [] = {"1", "2", "3"};
  String BATCH_STATES [] = {"1", "0"};
  String CAFE_STATE [] = {"1", "0"};
  int rIndex;

  TableRow row;



  boolean exists;

  PImage photo;
  Student () {
  }

  Student (String code) {
    this.code = code;

    rIndex = table.findRowIndex (code, 0);
    exists = rIndex != -1;

    println ("Exists:", exists);
    println (code);

    row = table.getRow (rIndex);

    if (exists) {
      photo = loadImage("C:/Users/Dell/Desktop/desktop/project/project/Photos/"+code+".jpeg");
    }
  }

  boolean exists () {
    return exists;
  }
  String getcode () {
    return row.getString ("CODE");
  }
  String getName () {
    return row.getString ("NAME");
  }
  String getDepartment () {
    return row.getString ("DEPARTMENT");
  }
  String getSchoolyear () {
    return row.getString ("SCHOOL YEAR");
  }
  String getDOB () {
    return row.getString ("DOB");
  }
  String getInternship () {
    return row.getString ("INTERNSHIP");
  }
  String getcafestatus () {
    return row.getString ("CAFEE");
  }
  void setInternshipState (int index) {
    //state = INTERNSHIP_STATES [index]
    // set state at row, "COLUMN"

    String state = INTERNSHIP_STATES [index];

    row.setString("INTERNSHIP", state);
      saveTable (table, tablePath);
    println ("Saved State:", state);
  }
  void setbatchState (int index) {
    String batchstate =  BATCH_STATES [index];

    row.setString("BATCH", batchstate);
    saveTable (table, tablePath);
  }
  void setCafestate (int index) {
    String cafestate = CAFE_STATE [index];

    row.setString("CAFEE", cafestate);

  }

  boolean isCafe () {
    return getcafestatus ().equals ("1");
  }
  boolean isInternship () {
    return getInternship ().equals ("1");
  }
  boolean isSpecialIntern () {
    return getInternship().equals("2");
  }

  // ...

  boolean hadBreakfast () {
    return row.getString (getMealStamp()).equals ("1");
  }
  boolean hadLunch () {
    return row.getString (getMealStamp ()).equals ("1");
  }

  boolean hadDinner () {
    return row.getString (getMealStamp()).equals("1");
  }

  PImage getPhoto () {
    return photo;
  }

  String getgender() {
    return row.getString ("GENDER");
  }
}
