class Bar {
  BarButton barButtons [];

  Bar () {
    barButtons = new BarButton [0];

    barButtons = (BarButton []) append (barButtons, new BarButton(698, 44, 74, "HOME"));
    barButtons = (BarButton []) append (barButtons, new BarButton(785, 44, 145, "VERIFICATION"));
    barButtons = (BarButton []) append (barButtons, new BarButton(946, 44, 86, "PROFILE"));
    barButtons = (BarButton []) append (barButtons, new BarButton(1055, 44, 83, "REPORT"));
    barButtons = (BarButton []) append (barButtons, new BarButton(1160, 44, 107, "SIGN OUT"));
  }

  void activate (int index) {
    barButtons [index].pressed = true;

    for (int x = 0; x < barButtons.length; x ++) {
      if (x != index) {
        barButtons [x].pressed = false;
      }
    }
  }
  int getActive () {
    for (int x = 0; x < barButtons.length; x ++) {
      if (barButtons [x].pressed == true) {
        return x;
      }
    }
    return -1;
  }

  void draw () {
    for (int b = 0; b < barButtons.length; b ++) {
      barButtons [b].draw ();
    }
  }

  void mouseReleased () {
    for (int b = 0; b < barButtons.length; b ++) {
      if (barButtons [b].hovered ()) {
        barButtons [b].pressed = true;

        for (int x = 0; x < barButtons.length; x ++) {
          if (x != b) {
            barButtons [x].pressed = false;
          }
        }
      }
    }
  }
}

class BarButton {
  float x, y;
  String bar;
  float w; 
  float h = 48;
  boolean pressed=false;

  BarButton(float x, float y, float w, String bar) {
    this.x = x;
    this.y = y;
    this.w=w;
    this.bar = bar;
  }
  void draw() {
    stroke(255, 255 * 0.20);
    line (0, 127, 1366, 127);
    noStroke();
    textAlign (LEFT, TOP);
    fill (white);
    image(ucheck, 68, 45, 35, 38);

    textFont (MontserratSemiBold);
    textSize (29);
    text ("U-Check", 119, 45);
    image(user, 1283, 45);
    if (hovered()) {
      fill(#544E7F);
      rect(x, y, w, h, 4);
      fill (255);
      textAlign(CENTER, CENTER);
      textFont(MontserratBold);
      textSize(14);
      text(bar, x + w/2, y + h/2 - textDescent ()/2);
    } else {
      noFill();
      rect(x, y, w, h);
      fill (white);
      textAlign(CENTER, CENTER);
      textFont(MontserratBold);
      textSize(14);
      text(bar, x + w/2, y + h/2 - textDescent ()/2);
    }
    if (pressed == true) {
      fill(255);
      rect(x, y, w, h, 4);
      fill (purple);
      textAlign(CENTER, CENTER);
      textFont(MontserratBold);
      textSize(14);
      text(bar, x + w/2, y + h/2 - textDescent ()/2);
    }
  }

  boolean hovered() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
}
