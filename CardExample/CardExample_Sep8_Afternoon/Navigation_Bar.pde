class navigator {
  // Container

  void draw() {

    PImage search, symbolx;

    search=loadImage("C:/Users/Dell/Desktop/image/search.png");
    symbolx = loadImage("C:/Users/Dell/Desktop/image/x.png");
    noStroke ();
    fill (#282843);
    rect (68, 171, 301, 39, 4);
    image(search, 83, 181);
    fill(#68687B);
    rect (274, 177, 55, 27);
    fill (#282843);
    textAlign(LEFT, TOP);
    text("1,098", 281, 180);

    fill(#FDFDFD, 255 * 0.30);
    textAlign (LEFT, TOP);
    textSize(15);
    text("Search", 113, 180);
    fill(#FDFDFD);
    image(symbolx, 340, 181, 20, 20);
  }
}
