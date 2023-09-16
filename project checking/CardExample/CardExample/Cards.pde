class Cards {
  //Movie movie1;

  String label1, label2, label3;

  float x, y;
  float w = 440, h = 260;
  float headerH = 39;
  float radius = 4;

  color accentColor;

  Cards (float x, float y, String label1, String label2, String label3, Movie movie1, color accentColor) { // Constructor
    this.x = x;
    this.y = y;

    this.label1 = label1;
    this.label2 = label2;
    this.label3 = label3;

    this.accentColor = accentColor;
  }

  void draw () {
    // Container
    noStroke ();
    fill (purpleDark);
    rect (x, y, w, h, radius);

    // Feed

    image (movie1, x, y, w, h);
    image (movie2, x, y, w, h);
    // Header
    fill (purpleMid, 255 * 0.80);
    rect (x, y, w, headerH, radius, radius, 0, 0);

    // Accent elements
    fill (accentColor);
    rect (x, y + 7, 5, 25);

    fill (accentColor, 255 * 0.50);
    rect (x, y + h - 4, w, 4, 2);

    fill (accentColor);
    rect (x, y + h - 4, 6, 4, 2);

    // Label 1 & 2
    textFont (helveticaBold);
    textSize (15);
    fill (purplePale);
    textAlign (LEFT, CENTER);
    text (label1 + " • " + label2, x + 15.5, y + headerH/2);

    // Label 3
    textAlign (RIGHT, CENTER);
    text (label3, x + w - 15.5, y + headerH/2);
  }
}
