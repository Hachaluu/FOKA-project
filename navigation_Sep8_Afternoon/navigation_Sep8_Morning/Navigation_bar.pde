class Navigationbar {
  float x, y;
  String header, countbox;
  int countnumber;
  PImage image, imagess;
  color accentColor;


  Navigationbar (float x, float y, String header, int countnumber, PImage image) {
    this.x = x;
    this.y = y;
    this.header = header;
    this.countnumber = countnumber;
    this.image = image;
  }
  Navigationbar (float x, float y, String header, int countnumber, PImage image, color accentColor) {
    this.x = x;
    this.y = y;
    this.header = header;
    this.countnumber = countnumber;
    this.image = image;
    this.accentColor = accentColor;
  }
  void draw() {
    noStroke();

    fill (#282843);
    rect (x, y, 301, 39, 4);
    fill (#282843);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 213, y + 9);

    fill(#FDFDFD, 255 * 0.30);
    textAlign (LEFT, TOP);
    textSize(15);
    text(header, x + 16, y + 9);
    textFont (helveticaBold);
    text ("1. Gate 1", 84, 234);
    text ("2. Gate 2", 84, 288);
    text ("3. Gate 3", 84, 342);
    text ("4. Gate 4", 84, 394);
    fill(white);
    image(image, x + 271, y + 10, 20, 20);
    fill(purplepale);
    rect (x + 206, y + 6, 55, 27, 4);
    fill (purpleMid);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 216, y + 9);
    stroke(255, 255 * 0.20);
    line (0, 127, 1366, 127);



    //rect (785, 45, 145, 38);

    // Container

    noStroke ();

    fill (purpleMid);
    rect(x, y, 301, 39, 4);
    rect (68, 387, 301, 39, 4);
    
    //bars


    fill (purpleMid);
    rect (68, 387, 301, 321);
    fill(purplepale);
    rect (x + 206, y + 6, 55, 27, 4);
    fill (purpleMid);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 221, y + 9);
    fill(white, 255 * 0.30);
    textAlign (LEFT, TOP);
    textSize(15);
    text(header, x + 36, y + 9);
    fill(white);
    image(image, x + 271, y + 10, 20, 20);

    //fill(#FDFDFD);

    fill (accentColor);
    rect (x, y + 7, 5, 25);
    fill (white);
    image(ucheck, 68, 45, 35, 38);

    //Header bars 
    fill (white);
    textAlign(LEFT, TOP);
    text ("HOME", 710, 54);
    text ("VERIFICATION", 799, 54);
    text ("PROFILE", 955, 54);
    text ("Report", 1065, 54);
    text( "SING OUT", 1117, 54);
    textSize (29);
    textFont (MontserratSemiBold);
    text ("U-Check", 119, 54);
    textFont (helveticaReg);
    text("Closing in: 00 : 37 : 59", 274, 45, 279, 38);

    //Search area
    fill(purpleMid);
    rect (68, 171, 301, 39);
    text ("Search", 113, 180);
    image(search, 83, 181, 20, 20);
    fill(purplepale);
    rect (274, 177, 55, 27, 4);
    fill (purpleMid);
    textAlign(LEFT, TOP); 
    text("1098", 285, 180);
  }
}
