class Profiles {
  String name;
  int age;
  String code;
  String sex;
  int schoolyear;
  String Department;
  String cafeStatus;
  int x = 0;
  int y = 212;
  int w = 223;
  int h = 56;
  Profiles () {
  }

  void draw() {
    noStroke();
    fill (255);
    textAlign (LEFT, TOP);
    textFont (MontserratBold);
    textSize (29);
    text ("Student Profile", 256, 131);
    noFill();
    textFont (RobotoBold);

    //box clicked
    //fill (#6237A0);
    rect (x, y, w, h, 0, 36, 36, 0);

    //textAlign (LEFT, TOP);
    //textFont (MontserratBold);
    //textSize (15);
    //fill(255);
    //text ("ALL STUDENTS", x + 63, y + 18);
    //text ("CAFE", x + 63, 284);
    //text ("NON-CAFE", x + 63, 340);
    //text ("INTERNS", x + 63, 396);
    //text ("SPECIAL", x + 63, 452);
    //if (hovered1()) {
    //  fill (255, 255 * 0.20);
    //  rect (x, y, w, h, 0, 36, 36, 0);
    //  fill(255);
    //   text ("ALL STUDENTS", x + 63, y + 18);
    //}
    //if (hovered2()) {
    //  fill (255, 255 * 0.20);
    //  rect (x, 267, w, h, 0, 36, 36, 0);
    //  fill(255);
    //   text ("CAFE", x + 63, 284);
    //}
    //if (hovered3 () ) {
    //  fill (255, 255 * 0.20);
    //  rect (x, 323, w, h, 0, 36, 36, 0);
    //  fill(255);
    //  text ("NON-CAFE", x + 63, 340);
    //}
    //if (hovered4()) {
    //  fill (255, 255 * 0.20);
    //  rect (x, 379, w, h, 0, 36, 36, 0);
    //  fill(255);
    //text ("INTERNS", x + 63, 396);
    //}
    //if (hovered5()) {
    //  fill (255, 255 * 0.20);
    //  rect (x, 435, w, h, 0, 36, 36, 0);
    //  fill(255);
    //text ("SPECIAL", x + 63, 452);
    //}


    //fill(255, 255 * 0.10);
    //rect (26, 614, 197, 56, 4); 
    //rect (26, 683, 197, 56, 4);

    //fill(255);
    //textAlign (CENTER, CENTER);
    //text ("IMPORT", 26 + 197/2, 614 + 56/2 - textDescent ()/2);
    //text ("SCAN ID", 26 + 197/2, 683 + 56/2 - textDescent ()/2);
  }
}

boolean hovered1() {
  return mouseX >= 0 && mouseX <= 223   && mouseY >= 210 && mouseY <= 210 + 56;
}

boolean hovered2() {
  return mouseX >= 0 && mouseX <= 223   && mouseY >= 267 && mouseY <= 267 + 56;
}

boolean hovered3() {
  return mouseX >= 0 && mouseX <= 223   && mouseY >= 323 && mouseY <= 323 + 56;
}

boolean hovered4() {
  return mouseX >= 0 && mouseX <= 223   && mouseY >= 379 && mouseY <= 379 + 56;
}

boolean hovered5() {
  return mouseX >= 0 && mouseX <= 223   && mouseY >= 435 && mouseY <= 435 + 56;
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
