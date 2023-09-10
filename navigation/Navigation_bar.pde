class Navigationbar {
  float x, y;
  String header, countbox;
  int countnumber;
  PImage image, imagess;
  color accentColor;


  Navigationbar (float x, float y, String header, int countnumber, PImage image,color accentColor) {
    this.x = x;
    this.y = y;
    this.header = header;
    this.countnumber = countnumber;
    this.image = image;
    
    this.accentColor = accentColor;
    
  }
  Navigationbar (float x, float y, PImage imagess, String header, int countnumber, PImage image,color accentColor) {
    this.x = x;
    this.y = y;
    this.header = header;
    this.countnumber = countnumber;
    this.image = image;
    this.imagess = imagess;
    this.accentColor = accentColor;
  }
  void draw() {
    noStroke();
    fill (#282843);
    rect (x, y, 301, 39, 4);
    image(images, 87, 181, 20, 20);
    fill (#282843);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 213, y + 9);

    fill(#FDFDFD, 255 * 0.30);
    textAlign (LEFT, TOP);
    textSize(15);
    text(header, x + 45, y + 9);
    fill(white);
    image(image, x + 271, y + 10, 20, 20);
    fill(purplepale);
    rect (x + 206, y + 6, 55, 27,4);
    fill (purpledark);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 216, y + 9);
  

  
    // Container


    
     fill (purpledark);
    rect(x,y,301,39);
    fill(purplepale);
    rect (x + 206, y + 6, 55, 27,4);
    fill (purpledark);
    textAlign(LEFT, TOP); 
    text(countnumber, x + 221, y + 9);
    fill(white, 255 * 0.30);
    textAlign (LEFT, TOP);
    textSize(15);
    text(header, x + 36, y + 9);
    fill(white);
    image(image, x + 271, y + 10, 20, 20);
     
    //fill(#FDFDFD);
    image(imagess,x + 16, y + 9, 13, 20);
    fill (accentColor);
    rect (x,y + 7,5,25);
    
    //Header bars 
    fill (white );
    textAlign(LEFT, CENTER);
    
    text( "SING OUT", 1156, 45, 107, 38);
    text ("Report", 1051, 45, 64, 38);
    text ("PROFILE", 941, 45, 99, 38);
    text ("VERIFICATION", 785, 45, 145, 38);
    text ("HOME", 696, 45, 78, 38);
    textSize (29);
   // textFont (MontserratSemiBold);
    text ("U-cHECK",119, 44);
    //textFont (helveticaReg);
    text("Closing in: 00 : 37 : 59", 274, 45, 279, 38);
   
  }
}
