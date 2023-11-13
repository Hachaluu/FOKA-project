import processing.video.*;
Movie movie1, movie2, movie3, movie4;
String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";
String iTablePath ="C:/Users/Dell/Desktop/desktop/project/project/internTable.csv";

String path1 = "http://192.168.43.128:8080/video";
String path2 = "http://192.168.43.3:8080/video";
//String path3 = "http://192.168.8.107:8080/video";
//String path4 = "http://192.168.8.107:8080/video";

Table table, internTable;

float w = 440, h = 260;

boolean IsBreakfasttime;
boolean IsLunchtime;
boolean IsDinnertime;
String used = "1";

DReport dReport;

Navigationbar N, n1, n2, n3, n4, n5;
Cards gate1, gate2, gate3, gate4;
Bar bar;
NavBars navbar;
rNavBars rnavbar;

Pages page;
Gates G1, G2, G3, G4;
Home Numbers;
Reports report;

Profiles Headers; 
Periodically semesterChangePeriod;

Fonts fonts;

MTable selectedTable, allStudents, cafe, noncafe, intern, special, searchTable;

RTable daily, monthly, annually;

DropDownMenu internship, batch, Cafee, Year, Month, Day;

Search pSearch, rSearch;

void setup() {
  FONTS();
  IMAGE();
  fullScreen ();

  dReport = new DReport ();

  n1 = new Navigationbar(68, 225, "", 272, symbolT, red);
  n2 = new Navigationbar(68, 279, "", 230, symbolT, green);
  n3 = new Navigationbar(68, 333, "", 294, symbolT, lightblue);
  n4 = new Navigationbar(68, 387, "", 302, symbolN, yellow);

  //Gates detail
  G1 = new Gates(68, 225, "1.   Gate1", symbolx, red, 272);
  G2 = new Gates(68, 279, "2.   Gate2", symbolx, green, 272);
  G3 = new Gates(68, 333, "3.   Gate3", symbolx, lightblue, 272);
  G4 = new Gates(68, 387, "4.   Gate4", symbolx, yellow, 272);

  // Feed from camera (scanner)
  //movie1 = new Movie(this, path1);
  //movie1.loop();
  //movie2 = new Movie(this, path2);
  //movie2.loop();
  //movie3 = new Movie (this,path3);
  //movie3.loop();
  //movie4 = new Movie (this, path4);
  //movie4.loop();


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

  rnavbar = new rNavBars();
  rnavbar.activate(0);

  report = new Reports();
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
  String Years [] = {"2023", "2022", "2021", "2020"};
  String Months []  = {"January", "February", "March", "April", "June", "July", "Augest", "September", "October", "November", "December"};
  String Days [] = {"1", "2", "3", "4"};
  internship = new DropDownMenu ("Internship", internTypes, 1175, 195, 146, 56);
  batch = new DropDownMenu ("Batch", Batch, 1006, 195, 146, 56);
  Cafee = new DropDownMenu ("Cafe-Stat.", cafetypes, 832, 195, 146, 56);

  Year = new DropDownMenu ("Year", Years, 814, 191, 145, 56);
  Month = new DropDownMenu ("Month", Months, 992, 191, 145, 56);
  Day = new DropDownMenu ("Day", Days, 1170, 191, 141, 56);
  //Search by name/ code

  pSearch = new Search ("Search by ID ", 259, 195, 488, 56);
  pSearch.active = true;
  rSearch = new Search ("Search by ID", 259, 198, 488, 56);
  rSearch.active = true;

  //adding report table
  String headers [] = {"Date", "Breakfast", "Lunch", "Dinner", "Total", "Average", "Minimum", "Maximum", "Percentage"};
  daily = new RTable(headers, 256, 266);

  dReport.generate (); 
  String [] dailyReport = getDailyReport(str (year ()), monthsOfTheYear [month () - 1], str (day ()));
  daily.rows = new ArrayList <RRow> ();
  daily.addRow(dailyReport);
  printArray (dailyReport);

  monthly =new RTable(headers, 256, 266);  
  for (int x = 1; x <= 31; x ++) {
    String Mlables [] = {"October "+ x +","+year(), "1200", "2159", "977", "4392", "23% | 17% | 60%", "Dinner", "Lunch", "23% | 17% | 60%"};
    monthly.addRow(Mlables);
  }

  annually = new RTable(headers, 256, 266);
  String lables [] = {"January", "February", "March", "April", "June", "July", "Augest", "September", "October", "November", "December"};
  for (int c = 0; c < lables.length; c ++) {
    String Mlables [] = {lables[c], "1200", "2159", "977", "4392", "23% | 17% | 60%", "Dinner", "Lunch", "23% | 17% | 60%"}; 
    annually.addRow(Mlables);
  }
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
  Day.mousePressed();
  Year.mousePressed();
  Month.mousePressed();
  rnavbar.mousePressed();

  //report navigation bar selection

  if (rnavbar.getActive() == 1) {
    daily.draw();
  } else if (rnavbar.getActive() == 2) {
    monthly.draw();
  } else if (rnavbar.getActive() == 3) {
    annually.draw();
  }

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

    // Reports
    Year .mousePressed();
    Day.mousePressed();
    Month.mousePressed();
    rSearch.mousePressed();
  }
}

void mouseWheel (MouseEvent e) {
  selectedTable.mouseWheel(e);
  searchTable.mouseWheel(e);

  daily.mouseWheel(e);
  monthly.mouseWheel(e);
  annually.mouseWheel(e);
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed () {
  if (page.isProfile()) {
    println ("HERE K");
    String prevS   = pSearch.value;

    pSearch.keyPressed();
    //rSearch.keyPressed();


    if (!prevS.equals (pSearch.value)) {
      Student student = new Student (pSearch.value);
      if (student.exists()) {
        String sLables [] = {student.getName(), "UC-"+student.getcode(), student.getAge(), student.getgender(), student.getSchoolyear(), student.getDepartment(), student.getallcafestatus()};
        searchTable.clearRowEntries();
        searchTable.addRow (sLables);
      }
    }
  }
  if (page.isVerification()) {
    if (key == '1') {
      gate1.setStudentCode ("HOEPY");
    } else if (key == '2') {
      gate2.setStudentCode ("3OFFR");
    } else if (key == '3') {
      gate3.setStudentCode ("CUF0E");
    } else if (key == '4') {
      gate4.setStudentCode ("SATCI");
    } else if (key == '5') {
      gate1.setStudentCode("QLG0K");
    } else if (key == '6') {
      gate2.setStudentCode("0E47Z");
    } else if (key == '7') {
      gate1.setStudentCode("RFFHK");
    } else if (key == '8') {
      gate2.setStudentCode("CVBMC");
    } else if (key == '9') {
      gate1.setStudentCode("SSIZT");
    } else if (key == '0') {
      gate2.setStudentCode("NOPSN");
    }
  }
}
