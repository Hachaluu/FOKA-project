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

    fill (purpleMid);
    rect (68, 387, 301, 321, 4);
    
    // Container
    stroke(255, 255 * 0.20);
    line(81, 426, 350, 426);
    noStroke ();

    fill(white, 255 * 0.30);
    textAlign (LEFT, TOP);
    textSize(15);
    text(header, x + 36, y + 9);
    
    fill (white);
    image(ucheck, 68, 45, 35, 38);

    textFont (MontserratSemiBold);
    textSize (29);
    text ("U-Check", 119, 45);

    textFont (helveticaReg);
    fill(white);
    textSize (29);
    text("Closing in: 00 : 37 : 59", 274, 40);

    //Search area
    textSize(15);
    fill(purpleMid);
    rect (68, 171, 301, 39, 4);

    fill(white, 255*0.50);
    text ("Search", 113, 180);

    image(search, 83, 181, 20, 20);
    fill(purplepale);
    rect (274, 177, 55, 27, 4);
    fill (purpleMid);
    textAlign(LEFT, TOP); 
    text("1098", 285, 180);

    
    fill(#3E3E56);
    noStroke();
    rect(90, 490, 239, 27, 4);
    textFont(helveticaMed);
    textSize(15);
    fill(white);
    text ("Wolde Getachew Abera", 104, 435);
    text ("Tekletsadik Abera Aseffa", 104, 464);
    text ("Dessalegn Tekle Bonsa", 104, 493);
    text ("Ashenafi Wikdemichael Getu", 104, 522);
    text ("Wondemagegn Asfaw Bayu", 104, 551);
    text ("Yetemwerk Sewaferahu Des.", 104, 580);
    text ("Wolde Getachew Abera", 104, 609);
    text ("Tekletsadik Abera Aseffa", 104, 638);
    text ("Dessalegn Tekle Bonsa", 104, 667);
    
  }
}




class Gates {
  float x, y;
  String gate;
  PImage image;
  int people ;
  color accentColor;
  int w = 301, h = 39;
  int countnumber;
  Gates (float x, float y, String gate, PImage image, color accentColor, int countnumber) {
    this.x = x;
    this.y = y;
    this.countnumber = countnumber;
    this.gate = gate;
    this.accentColor = accentColor;
    this.image = image;
  }
  void draw() {
   
    
    fill (purpleMid);
    rect (x, y, w, h, 4);
    fill(accentColor);
    rect(x, y +7, 5, 25);
    fill(purplepale);
    rect (x + 206, y + 6, 55, 27, 4);
    fill (purpleMid);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 221, y + 9);
    fill(#B5B5BE);
    
    textAlign (LEFT, TOP);
    textSize(15);
    textFont (helveticaBold);
    text(gate, x + 16, y + 9);
    image(image, x + 271, y + 10);
    
  }
}
