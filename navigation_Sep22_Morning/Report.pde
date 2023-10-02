class Reports {
  Reports () {
  }

  void draw() {
    noStroke ();
    fill(255);
    textFont (MontserratBold);
    textSize (29);

    textAlign (LEFT, TOP);
    if (rnavbar.getActive() == 0) {      
      text ("Report / Daily", 265, 131);
    } else if (rnavbar.getActive() == 1) {
      text ("Report / Monthly", 265, 131);
    } else if (rnavbar.getActive() == 2) {
      text ("Report / Annually", 265, 131);
    }
  }
}
