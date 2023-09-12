import processing.video.*;
Movie movie1, movie2, movie3, movie4;

String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

String path1 = "http://192.168.43.123:8080/video";
String path2 = "http://192.168.43.123:8080/video";

Table table;

String code="OGGKC";

Navigationbar N, n1, n2, n3, n4, n5;
Cards gate1, gate2, gate3, gate4;
Bars bar1, bar2, bar3, bar4, bar5;

void setup() {

  table = loadTable(tablePath, "header");
  FONTS();
  IMAGE();
  fullScreen ();
  N = new Navigationbar(68, 171, "Search", 1089, symbolx, purpleDark);
  n1 = new Navigationbar(68, 225, "", 272, symbolT, red);
  n2 = new Navigationbar(68, 279, "", 230, symbolT, green);
  n3 = new Navigationbar(68, 333, "", 294, symbolT, lightblue);
  n4 = new Navigationbar(68, 387, "", 302, symbolN, yellow);

  //movie1 = new Movie(this, path2);
  //movie1.loop();
  //movie2 = new Movie(this, path1);
  //movie2.loop();
  gate1 = new Cards (402, 171, "Gate 1", "Scanning ...", "Last Entry: 9sec ago", null, red);
  gate2 = new Cards (858, 171, "Gate 2", "", "Last Entry: 3sec ago", null, green);
  gate3 = new Cards (402, 448, "Gate 3", "", "Last Entry: 5sec ago", null, lightblue);
  gate4 = new Cards (858, 448, "Gate 4", "", "Last Entry: 2sec ago", null, yellow);

  //Creating the bar of the top of the page
  bar1 = new Bars(698, 44, 74, "HOME");
  bar2 = new Bars(785, 44, 145, "VERIFICATION");
  bar3 = new Bars(946, 44, 86, "PROFILE");
  bar4 = new Bars(1055, 44, 83, "REPORT");
  bar5 = new Bars(1160, 44, 107, "SIGN OUT");


  gate1.setStudentCode(code);
  gate2.setStudentCode(code);
  //if (movie1 == null) {
  gate1.state = 1;
  //}else gate1.state = 0;

  //println (code);
}
void draw() {

  background (background);
  N.draw();
  gate1.draw ();
  gate2.draw ();
  gate3.draw();
  gate4.draw();
  n1.draw();
  n2.draw();
  n3.draw();
  n4.draw();
  bar1.draw();
  bar2.draw();
  bar3.draw();
  bar4.draw();
  bar5.draw();
}

void movieEvent(Movie m) {
  m.read();
}
