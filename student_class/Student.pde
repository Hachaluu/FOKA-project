class Student {
  String code;

  int rIndex;

  TableRow row;

  boolean exists;

  Student (String code) {
    this.code = code;

    rIndex = table.findRowIndex (code, 0);
    exists = rIndex != -1;

    row = table.getRow (rIndex);
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
  String getgender(){
   return row.getString ("GENDER"); 
  }
}
