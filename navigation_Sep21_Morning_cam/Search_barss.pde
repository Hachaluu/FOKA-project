class NavBars {
  SearchButton searchButtons[];
  NavBars () {
    searchButtons = new SearchButton [0];

    searchButtons = (SearchButton []) append (searchButtons, new SearchButton(0, 267, 223, 56, "ALL STUDENTS"));
    searchButtons = (SearchButton []) append (searchButtons, new SearchButton(0, 323, 223, 56, "CAFE"));
    searchButtons = (SearchButton []) append (searchButtons, new SearchButton(0, 379, 223, 56, "NON-CAFE"));
    searchButtons = (SearchButton []) append (searchButtons, new SearchButton(0, 435, 223, 56, "INTERNS"));
    searchButtons = (SearchButton []) append (searchButtons, new SearchButton(0, 491, 223, 56, "SPECIAL"));
  }
  void activate (int index) {
    searchButtons [index].pressed =true;
    for (int a = 0; a < searchButtons.length; a ++) {
      if (a != index) {
        searchButtons [a].pressed = false;
      }
    }
  }
  int getActive () {
    for (int a = 0; a < searchButtons.length; a ++) {
      if (searchButtons [a].pressed == true) {
        return a;
      }
    }
    return -1;
  }
  void draw () {

    for (int a = 0; a < searchButtons.length; a ++) {
      searchButtons [a].draw();
    }
  }

  void mousePressed () {
    for (int a = 0; a < searchButtons  .length; a ++) {
      if (searchButtons [a].hovered()) {
        searchButtons [a].pressed = true;

        for (int c = 0; c < searchButtons.length; c ++) {
          if (c != a) {
            searchButtons [c].pressed = false;
          }
        }
      }
    }
  }
}
class SearchButton {
  float x;
  float y;
  float w;
  float h;
  String Search;
  boolean pressed = false;
  SearchButton(float x, float y, float w, float h, String Search) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.Search = Search;
  }

  void draw () {
    rectMode (CORNER);
    noStroke();
    textAlign (LEFT, CENTER);
    textFont (MontserratBold);
    textSize (15);
    if (hovered()) {
      fill(255, 255 * 0.20);
      rect (x, y, w, h, 0, 36, 36, 0);
      fill(255);
      text (Search, x + w*0.3, y + h/2);
    } else if (!hovered()) {
      noFill();
      rect (x, y, w, h, 0, 36, 36, 0);
      fill(255);
      text (Search, x + w*0.3, y + h/2);
    }
    if (pressed == true) {
      fill(#6237A0);
      rect (x, y, w, h, 0, 36, 36, 0);
      fill(255);
      text (Search, x + w*0.3, y + h/2);
    }
  }

  boolean hovered() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
}
