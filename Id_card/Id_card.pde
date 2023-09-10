import static javax.swing.JOptionPane.*;

String code = showInputDialog ("Please enter you code");

String Name = "";
String DOB = "";
String Status = "";
String CafeUsage = "";
String Departement = "";
String CafeStatus = "";
String Internship = "";
String SchoolYear = "";
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";
;
Table table ;
table = loadTable (tablePath, "header");

boolean found =  false;

for (int i = 0; i < table.getRowCount (); i++) {
  if (code.equals(table.getString (i, "CODE") )) {
    //if (Name.equals( table.getString (i, "NAME"))) {
    Name = table.getString(i, "NAME");
    DOB =  table.getString (i, "DOB");
    CafeUsage = table.getString (i, "CAFEE");
    Status = table.getString (i, "INTERNSHIP");
    if (CafeUsage.equals("1") && Status.equals("0")) {
      CafeStatus = "Cafe User";
      Internship = "Not Intern ";
    } else if (CafeUsage.equals("1") && Status.equals("1")) {
      CafeStatus = "Cafe User";
      Internship = "Normal Intern";
    } else if (CafeUsage.equals ("1") && Status.equals ("2")) {
      CafeStatus = "Cafe User";
      Internship = "Special Intern";
    } else if (CafeUsage.equals ("0")) {
      CafeStatus = "Non cafe";
    }
    SchoolYear =  table.getString (i, "SCHOOL YEAR");
    Departement =  table.getString (i, "DEPARTMENT");

    println ("CODE: " + code );
    println ("NAME: " + Name);
    println ("Cafe Status: " + CafeStatus);
    println ("Internship: " + Internship );
    println ("DOB:" + DOB);
    println ("School Year: " + SchoolYear);
    println ("Departemernt: " + Departement);
    showMessageDialog (frame, "Code: " + code +"\n"+ "Name: " + Name + "\n" + "Status: " + CafeStatus + "\n"  + "Internship: "+Internship + "\n" + "DOB:  " + DOB +  "\n"  + "School Year: " + SchoolYear+   "\n"  + "Departement: " + Departement );
    found = true;
  }
}

if (!found) {
  println ("Invalid Input");
}
//}
