class Student {
  String code ;

  int rIndex;

  TableRow row;

  boolean exists;

  PImage photo;
  Student (String code) {
    this.code = code;
    
    rIndex = table.findRowIndex (code, 0);
    exists = rIndex != -1;

    row = table.getRow (rIndex);
    photo = loadImage("C:/Users/Dell/Desktop/desktop/project/project/Photos/"+code+".jpeg");
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
  
  PImage getPhoto () {
    return photo;
  }
  
  String getgender() {
    return row.getString ("GENDER");
  }
}
