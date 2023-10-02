class Profiles {
 
  Profiles () {
  }

  void draw() {
    noStroke();
    fill (255);
    textAlign (LEFT, TOP);
    textFont (MontserratBold);
    textSize (29);

    text ("Student Profile", 256, 131);
  }
}

void updateTables () {
  table = loadTable(tablePath, "header");
  String headerLabels [] = {"Student Name", "ID Code", "Age", "Sex", "School Year", "Department", "Status"};

  allStudents = new MTable (headerLabels, 256, 267);
  cafe = new MTable (headerLabels, 256, 267);
  noncafe = new MTable (headerLabels, 256, 267);
  intern = new MTable (headerLabels, 256, 267);
  special = new MTable (headerLabels, 256, 267);
  selectedTable = new  MTable (headerLabels, 256, 267);
  searchTable = new MTable (headerLabels, 256, 267);

  // Adding rowsja
  String names [] = table.getStringColumn ("NAME");
  String code []  = table.getStringColumn ("CODE");
  String gender [] = table.getStringColumn ("GENDER");
  String depart [] = table.getStringColumn ("DEPARTMENT");
  String CAFE []  = table.getStringColumn ("CAFEE");
  String Internship [] = table.getStringColumn ("INTERNSHIP");
  String schoolyear [] = table.getStringColumn ("SCHOOL YEAR");
  String cafestatus = "";
  for (int a = 0; a < 49; a ++) {
    if (CAFE[a].equals("1") ) {
      if (Internship[a].equals("1")) {
        cafestatus = "Cafe User (I)";
      } else if (Internship[a].equals("2")) {
        cafestatus = "Cafe User (Sp.)";
      } else cafestatus = "Cafe User";
    } else cafestatus = "Non Cafe";
    String rowLabels [] = {names[a], "UC-" + code [a], "18", gender[a], schoolyear[a], depart[a], cafestatus};

    // All Students
    allStudents.addRow (rowLabels);
    // Cafe
    if (cafestatus.equals ("Cafe User")) {
      cafe.addRow (rowLabels);
    }
    // Non cafe
    else if (cafestatus.equals ("Non Cafe")) {
      noncafe.addRow(rowLabels);
    } else if (cafestatus.equals("Cafe User (I)")) {
      intern.addRow(rowLabels);
    } else if (cafestatus.equals("Cafe User (Sp.)")) {
      special.addRow(rowLabels);
    }
  }
}
