import processing.video.*;
Movie movie1, movie2, movie3, movie4;

String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

//String path1 = "http://192.168.43.78:8080/video";
//String path2 = "http://192.168.43.145:8080/video";

Table table;

String code  = "HOEPY";

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

void setup() {

  table = loadTable(tablePath, "header");
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

  imageQ = new ZXING4P (); 

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


  gate2.setStudentCode(code);
  gate3.setStudentCode(code);
  gate4.setStudentCode(code);
  //if (movie1 == null) {
  gate1.state = 1;
  gate2.state = 1;
  gate3.state = 1;
  gate4.state = 1;
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

void keyPressed () {
  if (key == '1') {
    gate1.setStudentCode("SATCI");
    code = "SATCI";
  } else if (key == '2') {
    gate2.setStudentCode("HOEPY");
    code = "HOEPY";
  } else if (key == '3') {
    gate3.setStudentCode("D24AV");
    code = "D24AV";
  } else if (key == '4') {
    gate4.setStudentCode("HOPY");
  }else if (key == '5'){
    gate4.setStudentCode("RFFHK");
    code = "D24AV";
  }
}

void movieEvent(Movie m) {
  m.read();
}
