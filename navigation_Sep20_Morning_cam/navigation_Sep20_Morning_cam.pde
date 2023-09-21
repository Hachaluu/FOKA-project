import processing.video.*;
Movie movie1, movie2, movie3, movie4;
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";
String iTablePath ="C:/Users/Dell/Desktop/desktop/project/project/internTable.csv";

String path1 = "http://192.168.43.78:8080/video";
String path2 = "http://192.168.8.107:8080/video";

Table table, internTable;

float w = 440, h = 260;

boolean IsBreakfasttime;
boolean IsLunchtime;
boolean IsDinnertime;
String used = "1";

Navigationbar N, n1, n2, n3, n4, n5;
Cards gate1, gate2, gate3, gate4;
Bar bar;
NavBars navbar;

Pages page;
Gates G1, G2, G3, G4;
Home Numbers;
Reports r;

Profiles Headers; 
Periodically semesterChangePeriod;

Fonts fonts;

MTable selectedTable, allStudents, cafe, noncafe, intern, special, searchTable;

DropDownMenu internship, batch, Cafee;

Search pSearch;

void setup() {
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
  movie2 = new Movie(this, path2);
  movie2.loop();

  page = new Pages ();

  gate1 = new Cards (402, 171, "Gate 1", "Scanning...", null, red);
  gate2 = new Cards (858, 171, "Gate 2", "Scanning...", null, green);
  gate3 = new Cards (402, 448, "Gate 3", "Scanning...", null, lightblue);
  gate4 = new Cards (858, 448, "Gate 4", "Scanning...", null, yellow);

  // Home page viwer
  Numbers = new Home (697, 480, "2897");
  //Creating the bar of the top of the page
  bar = new Bar ();
  bar.activate (1);

  navbar = new NavBars();
  navbar.activate(0);

  r = new Reports();
  page.setVerification ();

  //Profile page

  Headers = new Profiles ();

  //Table
  fonts = new Fonts ();

  updateTables ();

  internTable = loadTable(iTablePath, "header");

  semesterChangePeriod = new Periodically (500);
  setIntern();
  println ("*");

  // adding the edition bars

  String cafetypes [] = {"Cafe-User", "Non-Cafe"};
  String Batch [] = {"Regular", "Out of Batch"};
  String internTypes [] = {"Intern", "Intern (Sp.)", "Intern (OB)"};
  internship = new DropDownMenu ("Internship", internTypes, 1175, 195, 146, 56);
  batch = new DropDownMenu ("Batch", Batch, 1006, 195, 146, 56);
  Cafee = new DropDownMenu ("Cafe-Stat.", cafetypes, 832, 195, 146, 56);

  //Search by name/ code

  pSearch = new Search ("Search by ID ", 259, 195, 488, 56);
  pSearch.active = true;
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

void mousePressed (MouseEvent e) {
  bar.mousePressed ();

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
  } else if (page.isProfile()) {
    navbar.mousePressed();

    //MTable selectedTable;
    if (navbar.getActive() == 0) { // All Students
      selectedTable = allStudents;
    } else if (navbar.getActive() == 1) {
      selectedTable = cafe;
    } else if (navbar.getActive() == 2) {
      selectedTable = noncafe;
    } else if (navbar.getActive() == 3) {
      selectedTable = intern;
    } else if (navbar.getActive() == 4) {
      selectedTable = special;
    }

    int prevActiveIndexes [] = selectedTable.getActiveIndexes();

    internship.mousePressed ();

    if (internship.hoveredMenu ()) {

      // Menu selected from the drop down menu
      if (!internship.value.isEmpty() && internship.hoveredMenu ()) {
        println ("Internship: "+internship.value);

        int activeIndexes [] = selectedTable.getActiveIndexes();

        if (activeIndexes.length > 0) {
          // activeIndexes [index here] -- iterate
          println ("Active indexes");
          printArray (activeIndexes);
          for (int x = 0; x < activeIndexes.length; x ++) {
            String IDcode = selectedTable.rows.get (activeIndexes [x]).labels [1];
            int uc = IDcode.indexOf("-");
            Student student = new Student (IDcode.substring(uc+1, IDcode.length()));
            student.setInternshipState(internship.selectedIndex);

            student.setbatchState(batch.selectedIndex);
          }

          updateTables ();
          internship.value = "";
        }
      }
    } else if (Cafee.hovered () || Cafee.hoveredMenu () && Cafee.active) {
      Cafee.mousePressed ();

      // Menu selected from the drop down menu
      if (!Cafee.value.isEmpty()) {
        println ("Cafee: "+Cafee.value);

        int activeIndexes [] = selectedTable.getActiveIndexes();

        if (activeIndexes.length > 0) {
          // activeIndexes [index here] -- iterate
          for (int x = 0; x < activeIndexes.length; x ++) {
            String IDcode = selectedTable.rows.get (activeIndexes [x]).labels [1];
            int uc = IDcode.indexOf("-");

            Student student = new Student (IDcode.substring(uc+1, IDcode.length()));
            student.setCafestate(Cafee.selectedIndex);
          }

          updateTables ();
          Cafee.value = "";
        }
      }
    } else if (batch.hovered () || batch.hoveredMenu () && batch.active) {
      batch.mousePressed ();

      // Menu selected from the drop down menu
      if (!batch.value.isEmpty() ) {
        println ("batch: "+batch.value);

        int activeIndexes [] = selectedTable.getActiveIndexes();

        if (activeIndexes.length > 0) {
          // activeIndexes [index here] -- iterate
          for (int x = 0; x < activeIndexes.length; x ++) {
            String IDcode = selectedTable.rows.get (activeIndexes [x]).labels [1];
            int uc = IDcode.indexOf("-");

            Student student = new Student (IDcode.substring(uc+1, IDcode.length()));
            student.setbatchState(batch.selectedIndex);
          }

          updateTables ();
          batch.value = "";
        }
      }
    } else {
      selectedTable.mousePressed (e);
      searchTable.mousePressed(e);
    }

    if (navbar.getActive () == 0) { // All students
      allStudents.setActiveIndexes (prevActiveIndexes);
      
    }

    //if (navbar.getActive() == 0) { // All Students
    //  allStudents = selectedTable;
    //} else if (navbar.getActive() == 1) {
    //  cafe = selectedTable;
    //} else if (navbar.getActive() == 2) {
    //  noncafe = selectedTable;
    //} else if (navbar.getActive() == 3) {
    //  intern = selectedTable;
    //} else if (navbar.getActive() == 4) {
    //  special = selectedTable;
    //}

    pSearch.mousePressed ();
  }
}

void mouseWheel (MouseEvent e) {
  selectedTable.mouseWheel(e);
  searchTable.mouseWheel(e);
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed () {  
  String prevS = pSearch.value;

  pSearch.keyPressed();

  if (!prevS.equals (pSearch.value)) {
    Student student = new Student (pSearch.value);
    if (student.exists()) {
      String sLables [] = {student.getName(), "UC-"+student.getcode(), student.getAge(), student.getgender(), student.getSchoolyear(), student.getDepartment(), student.getallcafestatus()};
      searchTable.clearRowEntries();
      searchTable.addRow (sLables);
    }
  }
}
