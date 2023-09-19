Periodically semesterChangePeriod;
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";
String iTablePath ="C:/Users/Dell/Desktop/desktop/project/project/internTable.csv";
Table table, internTable;
void setup () {

  table = loadTable(tablePath, "header");
  internTable = loadTable(iTablePath, "header");
  semesterChangePeriod = new Periodically (5000);
  setIntern();
}

void draw () {
  if (semesterChangePeriod.itsTime ()) {
    setIntern();
    print("*");
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
