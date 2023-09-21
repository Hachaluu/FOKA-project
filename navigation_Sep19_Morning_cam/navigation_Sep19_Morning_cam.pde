import processing.video.*;
Movie movie1, movie2, movie3, movie4;
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";
String iTablePath ="C:/Users/Dell/Desktop/desktop/project/project/internTable.csv";



String path1 = "http://192.168.43.78:8080/video";
String path2 = "http://192.168.8.173:8080/video";

Table table, internTable;

float w = 440, h = 260;

boolean IsBreakfasttime;
boolean IsLunchtime;
boolean IsDinnertime;
String used = "1";

Navigationbar N, n1, n2, n3, n4, n5;
Cards gate1, gate2, gate3, gate4;
Bar bar;
Pages page;
Gates G1, G2, G3, G4;
Home Numbers;
Reports r;

Profiles Headers; 
Periodically semesterChangePeriod;

Fonts fonts;

MTable allStudents;

DropDownMenu internship, batch, Cafee;

Search Search;

void setup() {

  table = loadTable(tablePath, "header");
  internTable = loadTable(iTablePath, "header");

  semesterChangePeriod = new Periodically (500);
  setIntern();
  println ("*");

  FONTS();
  IMAGE();
  fullScreen ();

  // N = new Navigationbar(68, 171, "Search", 1089, symbolx, purpleDark);
  n1 = new Navigationbar(68, 225, "", 272, symbolT, red);
  n2 = new Navigationbar(68, 279, "", 230, symbolT, green);
  n3 = new Navigationbar(68, 333, "", 294, symbolT, lightblue);
  n4 = new Navigationbar(68, 387, "", 302, symbolN, yellow);

  //Gates detail
  G1 = new Gates(68, 225, "1.   Gate1", symbolx, red, 272);
  G2 = new Gates(68, 279, "2.   Gate2", symbolx, green, 272);
  G3 = new Gates(68, 333, "3.   Gate3", symbolx, lightblue, 272);
  G4 = new Gates(68, 387, "4.   Gate4", symbolx, yellow, 272);
  //movie1 = new Movie(this, path1);
  //movie1.loop();
  //movie2 = new Movie(this, path2);
  //movie2.loop();

  page = new Pages ();

  gate1 = new Cards (402, 171, "Gate 1", "Scanning...", null, red);
  gate2 = new Cards (858, 171, "Gate 2", "Scanning...", null, green);
  gate3 = new Cards (402, 448, "Gate 3", "Scanning...", null, lightblue);
  gate4 = new Cards (858, 448, "Gate 4", "Scanning...", null, yellow);

  // Home page viwe
  Numbers = new Home (697, 480, "2897");
  //Creating the bar of the top of the page
  bar = new Bar ();
  bar.activate (1);
  r = new Reports();
  page.setVerification ();

  //Profile page

  Headers = new Profiles ();

  //Table
  fonts = new Fonts ();

  // Adding headers
  String headerLabels [] = {"Student Name", "ID Code", "Age", "Sex", "School Year", "Department", "Status"};
  allStudents = new MTable (headerLabels, 256, 267);

  // Adding rows
  String names [] = table.getStringColumn ("NAME");
  String code []  = table.getStringColumn ("CODE");
  String gender [] = table.getStringColumn ("GENDER");
  String depart [] = table.getStringColumn ("DEPARTMENT");
  String CAFE []  = table.getStringColumn ("CAFEE");
  String Internship [] = table.getStringColumn ("INTERNSHIP");
  String schoolyear [] = table.getStringColumn ("SCHOOL YEAR");
  String cafestatus;
  for (int a = 0; a < 49; a ++) {
    if (CAFE[a].equals("1") ) {
      if (Internship[a].equals("1")) {
        cafestatus = "Cafe User (N)";
      } else if (Internship[a].equals("2")) {
        cafestatus = "Cafe User (Sp.)";
      } else cafestatus = "Cafe User";
    } else cafestatus = "Non Cafe";
    String rowLabels [] = {names[a], "UC-" + code [a], "18", gender[a], schoolyear[a], depart[a], cafestatus};
    allStudents.addRow (rowLabels);
  }

  // adding the edition bars

  String cafetypes [] = {"Cafe-User", "Non-Cafe"};
  String Batch [] = {"Regular", "Out of Batch"};
  String internTypes [] = {"Intern", "Intern (Sp.)", "Intern (OB)"};
  internship = new DropDownMenu ("Internship", internTypes, 1155, 195, 146, 56);
  batch = new DropDownMenu ("Batch", Batch, 993, 195, 146, 56);
  Cafee = new DropDownMenu ("Cafe-Stat.", cafetypes, 832, 195, 146, 56);

  //Search by name/ code

  Search = new Search ("Search by name, ID, & more", 832, 126);
  Search.active = true;
}


void draw() {
  background (background);

  bar.draw ();

  if (page.isHome ()) {
    homepageDraw ();
  } else if (page.isVerification ()) {
    pageVerificationDraw ();
  } else if (page.isProfile()) {
    profilepageDraw();
  } else if (page.isReport()) {
    reportpageDraw();
  } else if (page.isSignOut()) {
    signoutpageDraw();
  }
}

void mouseReleased () {
  bar.mouseReleased ();

  if (bar.getActive () == 0) {
    page.setHome ();
  } else if (bar.getActive () == 1) {
    page.setVerification ();
    //pageVerificationDraw.draw();
  } else if (bar.getActive () == 2) {
    page.setProfile ();
  } else if (bar.getActive () == 3) {
    page.setReport();
  } else if (bar.getActive () == 4) {
    page.setSignout();
  }
  if (page.isHome()) {
    if (Numbers.hovered1 ()) {
      // Verification
      page.setVerification ();
      bar.activate(1);
    } else if (Numbers.hovered2 ()) {
      // Reportr
      page.setReport();
      bar.activate(3);
    }
  }
}

void mousePressed (MouseEvent e) {
  if (internship.hovered () || internship.hoveredMenu () && internship.active) {
    internship.mousePressed ();

    // Menu selected from the drop down menu
    if (!internship.value.isEmpty()) {
      println ("Internship: "+internship.value);

      int activeIndexes [] = allStudents.getActiveIndexes();

      if (activeIndexes.length > 0) {
        // activeIndexes [index here] -- iterate
        printArray (activeIndexes);
        for (int x = 0; x < activeIndexes.length; x ++) {
          String IDcode = allStudents.rows.get (activeIndexes [x]).labels [1];
          int uc = IDcode.indexOf("-");
          Student student = new Student (IDcode.substring(uc+1, IDcode.length()));
          student.setInternshipState(internship.selectedIndex);

          student.setbatchState(batch.selectedIndex);
        }
      }
    }
  } else if (Cafee.hovered () || Cafee.hoveredMenu () && Cafee.active) {
    Cafee.mousePressed ();

    // Menu selected from the drop down menu
    if (!Cafee.value.isEmpty()) {
      println ("Cafee: "+Cafee.value);

      int activeIndexes [] = allStudents.getActiveIndexes();

      if (activeIndexes.length > 0) {
        // activeIndexes [index here] -- iterate
        for (int x = 0; x < activeIndexes.length; x ++) {
          String IDcode = allStudents.rows.get (activeIndexes [x]).labels [1];
          int uc = IDcode.indexOf("-");

          Student student = new Student (IDcode.substring(uc+1, IDcode.length()));
          student.setCafestate(Cafee.selectedIndex);
        }
      }
    }
  } else if (batch.hovered () || batch.hoveredMenu () && batch.active) {
    batch.mousePressed ();

    // Menu selected from the drop down menu
    if (!batch.value.isEmpty() ) {
      println ("batch: "+batch.value);

      int activeIndexes [] = allStudents.getActiveIndexes();

      if (activeIndexes.length > 0) {
        // activeIndexes [index here] -- iterate
        for (int x = 0; x < activeIndexes.length; x ++) {
          String IDcode = allStudents.rows.get (activeIndexes [x]).labels [1];
          int uc = IDcode.indexOf("-");

          Student student = new Student (IDcode.substring(uc+1, IDcode.length()));
          student.setbatchState(batch.selectedIndex);
        }
      }
    }
  } else {
    allStudents.mousePressed (e);
  }

  //batch.mousePressed();
  //Cafee.mousePressed();

  //if (!batch.value.isEmpty()) {
  //  println ("batch: "+internship.value);
  //}
  //if (!Cafee.value.isEmpty()) {
  //  println ("Cafee: "+internship.value);
  //}


  Search.mousePressed ();
}

void mouseWheel (MouseEvent e) {
  allStudents.mouseWheel(e);
}

void movieEvent(Movie m) {
  m.read();
}


void keyPressed () {
  Search.keyPressed();
  
  String prevS = Search.value;
 if (prevS != Search.value){
 
  String names [] = table.getStringColumn ("NAME");
  String code []  = table.getStringColumn ("CODE");
  String gender [] = table.getStringColumn ("GENDER");
  String depart [] = table.getStringColumn ("DEPARTMENT");
  String CAFE []  = table.getStringColumn ("CAFEE");
  String Internship [] = table.getStringColumn ("INTERNSHIP");
  String schoolyear [] = table.getStringColumn ("SCHOOL YEAR");
  String cafestatus;
  println (prevS + Search.value);
  for (int c = 0 ; c < names.length; c ++){
  if (names[c].startsWith(prevS)){
    if (CAFE[c].equals("1") ) {
      if (Internship[c].equals("1")) {
        cafestatus = "Cafe User (N)";
      } else if (Internship[c].equals("2")) {
        cafestatus = "Cafe User (Sp.)";
      } else cafestatus = "Cafe User";
    } else cafestatus = "Non Cafe";
    String rowLabels [] = {names[c], "UC-" + code [c], "18", gender[c], schoolyear[c], depart[c], cafestatus};
    allStudents.addRow (rowLabels);
  }
}
}
}
