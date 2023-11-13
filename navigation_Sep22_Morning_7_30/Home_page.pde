class Home { 
  Student student;
  String cafeuser = "";
  int monthlyactive = 1400;
  PImage  ID = loadImage("C:/Users/Dell/Desktop/image/ID.png");
  float x, y, X, Y;
  int w = 85, h = 48;
  Home (float x, float y, String cafeuser) {
    this.cafeuser = cafeuser;
    this.x = x;
    this.y = y;
   // this.monthlyactive = monthlyactive;
  }
  void draw() {
    noFill();
    noStroke();
    rect(x, y, w, h);
    image(ID, 68, 243, 560, 409);
    textAlign(LEFT, CENTER);
    textFont (MontserratSemiBold);
    textSize(48);
    fill (255);
    text ("Scan, Sip, and Savor:", 696, 238);
    textFont(MontserratMed);
    textSize(35);
    text ("Fast & Seamless Service", 696, 315);
    text ("Verification System", 696, 361);
    textSize(15);
    text ("Cafe Users", 696, 441);
    text ("Monthly Active", 870, 441);
    text ("Next Meal: "+ Nextmeal(), 1061, 441);
    textSize (36);
    text(cafeuser, x, y );
   
    //if (student.getcafestatus().equals("1") ){
    //  monthlyactive ++;
    //}

    text (monthlyactive, 870, y );
    text (str(nextMealHour), 1066, 480);
    
    text (str(nextMealMin), 1132, 480);
    
    text (str(second()), 1188, 480);
    
    textSize(14);   
    text("Hrs", 1069, 519);
    text("Min", 1131, 519);
    text ("Sec", 1188, 519);
    
    fill (#633AD9);
    circle (871, 526, 10);
    circle (696, 526, 10);
    stroke(#633AD9);
    strokeWeight(2);
    line (825, 450, 825, 525);
    line (1021, 450, 1021, 525);

    textAlign(CENTER, CENTER);
    textFont(MontserratMed);
    textSize(20);
    if (!hovered1()) {
      noFill ();
      stroke(255);
      rect(696, 583, 219, 69, 35);
      fill(255);
      text("Verification",  696 + 219/2, 583 + 69/2 - textDescent ()/2);
    } else {
      noStroke();
      fill(#633AD9);
      rect(696, 583, 219, 69, 35);
      fill(255);
      text("Verification", 696 + 219/2, 583 + 69/2 - textDescent ()/2);
    }
    if (!hovered2()) {
      noFill ();
      stroke(255);
      rect(947, 583, 219, 69, 35);
      fill(255);
      text("View Report", 947 + 219/2, 583 + 69/2 - textDescent ()/2);
    } else {
      noStroke();
      fill(#633AD9);
      rect(947, 583, 219, 69, 35);
      fill(255);
      text("View Report", 947 + 219/2, 583 + 69/2 - textDescent ()/2);
    }
  }
  boolean hovered1() {
    return mouseX >= 696 && mouseX <= 696 + 219  && mouseY >= 583 && mouseY <= 583 + 35*2;
  }

  boolean hovered2() {
    return mouseX >= 947 && mouseX <= 947 + 219  && mouseY >= 583 && mouseY <= 583 + 35*2;
  }
}
