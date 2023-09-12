class Bars {
  float x, y;
  String bar;
  float w; 
  float h = 48;
  boolean pressed=false;

  Bars(float x, float y, float w, String bar) {
    this.x = x;
    this.y = y;
    this.w=w;
    this.bar = bar;
  }
  void draw() {
    noStroke();

    if (hovered()) {
      fill(#544E7F);
      rect(x, y, w, h, 4);
      fill (255);
      textAlign(LEFT, TOP);
      textFont(MontserratBold);
      textSize(14);
      text(bar, x + 14, y + 10);
      if (mousePressed) {
        pressed = true;
      }
    } else {
      noFill();
      rect(x, y, w, h);
      fill (white);
      textAlign(LEFT, TOP);
      textFont(MontserratBold);
      textSize(14);
      text(bar, x + 14, y + 10);
    }if (pressed == true) {
      fill(255);
      rect(x, y, w, h, 4);
      fill (purple);
      textAlign(LEFT, TOP);
      textFont(MontserratBold);
      textSize(14);
      text(bar, x + 14, y + 10);
    }
  }

  boolean hovered() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
  //void mmouseReleased() {
  //  fill(255);
  //  rect(x, y, w, h, 4);
  //  fill (purple);
  //  textAlign(LEFT, TOP);
  //  textFont(MontserratBold);
  //  textSize(14);
  //  text(bar, x + 14, y + 10);
  //}
}
