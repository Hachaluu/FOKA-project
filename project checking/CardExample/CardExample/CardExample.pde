import processing.video.*;

Cards gate1, gate2, gate3, gate4;
Movie movie1, movie2;

String path1 = "http://192.168.43.42:8080/video";
String path2 = "http://192.168.43.214:8080/video";
PImage background;


String bgPath = "data/images/background.png";

void setup () {
  fullScreen (1);
  background = loadImage (bgPath);

  helveticaBold = createFont ("data/fonts/helvetica/HelveticaNowDisplay-Bold.ttf", 12);

  // movie1 = new Movie

  // movie1.loop ();
  movie1 = new Movie(this, path1);
  movie1.loop();
  movie2 = new Movie(this, path2);
  movie2.loop();

  gate1 = new Cards (402, 171, "Gate 1", "Scanning ...", "Last Entry: 9sec ago", movie1, red);
  gate2 = new Cards (858, 171, "Gate 2", "", "Last Entry: 3sec ago", movie2, green);
  gate3 = new Cards (402, 448, "Gate 3", "", "Last Entry: 5sec ago", movie1, blue);
  gate4 = new Cards (858, 448, "Gate 4", "", "Last Entry: 2sec ago", movie2, yellow);
}

void draw () {
  background (background);

  gate1.draw ();
  gate2.draw ();
  gate3.draw();
  gate4.draw();
}
void movieEvent(Movie m) {
  m.read();
}
