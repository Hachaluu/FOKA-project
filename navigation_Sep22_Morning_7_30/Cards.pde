import com.cage.zxing4p3.*;
String cafee = "";
String cafeUsage = "";
String gender = "";
// 0: Feed | 1: Student Details | 2: Text (Disconnected/Fetching Feed ...)

class Cards {
  Movie movie;
  ZXING4P zxing;
  Student student;

  String label1, label2, label3 = "";
  String prevCode = "";

  int state = 0; // 0: Feed | 1: Student Details | 2: Text (Disconnected/Fetching Feed ...)
  long lastTime, patience = 7000;
  long lastMin;
  float x, y;
  float w = 440, h = 260;
  float headerH = 39;
  float radius = 4;

  boolean isEligible;
  boolean wasHere;
  PImage image;
  color accentColor;

  Cards (float x, float y, String label1, String label2, Movie movie, color accentColor) {

    // Constructor
    this.x = x;
    this.y = y;

    this.label1 = label1;
    this.label2 = label2;
    //this.label3 = label3;

    this.movie = movie;
    zxing = new ZXING4P();
    this.accentColor = accentColor;

    lastTime = -patience;
  }

  void setStudentCode (String code) {
    updateTable ();
    student = new Student (code);
    
    if (student.exists()) {
      if (ismealTime()) {
        if (!student.hadMeal ()) {
          state = 1;

          isEligible = true;

          lastTime = millis();
          lastMin = minute();
          everything (student);

          println (student.getcafestatus());
        } else {
          wasHere = true;
          state = 1;
          lastTime = millis();
        }
      } else {
        isEligible = false;
      }
    } else if (!student.exists()) {
      isEligible = false;
      state = 3;
      lastTime = millis();
    }
  }

  void draw () {
    // Container
    noStroke ();
    fill (purpleDark);
    rect (x, y, w, h, radius);
    // Header
    fill (purpleMid, 255 * 0.80);
    rect (x, y, w, headerH, radius, radius, 0, 0);

    long elapsedTime = millis() - lastTime;
    if (elapsedTime >= patience) {
      //lastTime = millis();
      state = 0;
    }

    if (movie != null && movie.height != 0 && movie.width != 0) {
      //copy (x, y, w, h, x + 401, y + 171, w, h);
      try { 
        //decodeQR (movie);
        String code = zxing.decodeImage (false, movie).trim ();

        if (!code.isEmpty () && !code.equals(prevCode)) {
          println ("Source 1: Code Read:" + code + "-" + prevCode);
          prevCode = code;
          lastTime = millis();  
          setStudentCode(code);

          if (student.exists()) {

            state=1;
            // intern();
            studentid(student, x, y);
            println ("valid code: " + student.getcode());
            println ("Name: ", student.getName ());
            println ("Department: ", student.getDepartment());
            if (student.getcafestatus().equals("1")) {
              println ("Cafe status: ", " Cafe user");
            } else println ("Cafe status: ", "Non cafe");

            if (student.getInternship() .equals("1")) {
              println ("INternship: ", "Normal intern");
            } else if (student.getInternship ().equals("0")) {
              println ("Internship: ", "Not intern student");
            } else println ("Internship", "Special Intern");
            println ("School Year: " +student.getSchoolyear());
            println ("DOB: "+student.getDOB());
          } else println ("Invalid code");
        }
      }
      catch (Exception e) {
        println (e);
      }
    }

    // Feed/Image/Text
    if (state == 0) {
      if (movie != null && movie.height != 0 && movie.width != 0) {
        image(movie, x, y, w, h);
        fill (255);
        textSize (24);
        text ("Fetching data", x + w/2, y + headerH/2);
      } else {
        fill (255);
        textAlign(CENTER, CENTER);
        textSize (24);
        text ("Disconnected ", x + w/2, y + h/2);
      }
    } else if (state == 3) {
      if (isEligible==false) {
        fill (255);
        textAlign(CENTER, CENTER);
        textSize (24);
        text ("Error", x + w/2, y + headerH/2);
        stroke(255, 0, 0);
        strokeWeight (1);
        noFill();
        rect (x, y, w, h, radius);
      }// Does not exist
      // Show ELIGIBILITY or IN_ELIGIBILITY
    } else if (state == 1) {
      if (student.exists()) {
        label3 = "Last Entry: " + (lastTime-second())/1000 + " Sec ago";

        fill(255);
        textAlign(CENTER, CENTER);
        // text("Scanning...",x + 40, y);
        studentid(student, x, y);

        if (!wasHere) {
          //changing the color of the borader of the id box
          stroke(0, 255, 0);
          strokeWeight (1);
          noFill();
          rect (x, y, w, h, radius);
        } else {
          fill (255);
          textAlign(CENTER, CENTER);
          textSize (14);
          text ("Have been here", x + w/2, y + headerH/2);
        }
      } else if (!student.code.isEmpty() && !student.exists()) {
        fill(255);
        text("Invalid code", x + 172, y + 125);
      } else text ("Fetching data", x + w/2, y + headerH/2);
    }

    noStroke ();

    //header
    // Accent elements
    fill (accentColor);
    rect (x, y + 7, 5, 25);

    // Progress Bar Track
    fill (accentColor, 255 * 0.50);
    rect (x, y + h - 4, w, 4, 2);

    // Progress Bar Thumb
    float thumbWidth = map (elapsedTime, 0, patience, 0, w);
    thumbWidth = constrain (thumbWidth, 0, w);
    fill (accentColor);
    rect (x, y + h - 4, w-thumbWidth, 4, 2);

    // Label 1 & 2
    textFont (helveticaBold);
    textSize (15);
    fill (purplePale);
    textAlign (LEFT, CENTER);
    text (label1 + " • ", x + 15.5, y + headerH/2);
    if (state == 1) {
      text(label2, x + 70, y + headerH/2);
    }
    // Label 3
    textAlign (RIGHT, CENTER);
    text (label3, x + w - 15.5, y + headerH/2);
    fill (0);
    line (0, 12, 1366, 0);
    if (hovered1()) {
      stroke(#453E7A);
      noFill();
      rect (x, y, w, h, radius);
    }
    if (hovered2()) {
      stroke(accentColor, 255 * 0.50);
      noFill();
      rect (x, y, w, headerH, radius, radius, 0, 0);
    }
    //  println(Nextmeal());
  }
  void studentidcard() {
    if (student.isCafe()) {
      if (student.getInternship().equals("1") ) {
        cafeUsage = "Cafe User (N)";
      } else if (student.getInternship() .equals("2")) {
        cafeUsage = "Cafe User (S)";
      } else if (!student.isInternship()) {
        cafeUsage = "Cafe User";
      }
    } else if (!student.isCafe()) {
      cafeUsage = "Non cafe";
    }
    if (student.getgender().equals("F")) {
      gender = "Female";
    } else if (student.getgender().equals ("M")) {
      gender = "Male";
    }
  }
  void studentid (Student student, float x, float y) {
    if (student == null)
      return;
    if (student.getPhoto () == null)
      return;

    studentidcard  ();
    image(student.getPhoto (), x + 30, y + 69, 121, 162);
    fill (255);
    textAlign(LEFT, TOP);
    text (student.getName(), x + 171, y + 99);
    text (gender, x + 172, y + 125);
    text (student.getDepartment(), x + 171, y +153);
    text (cafeUsage, x + 171, y + 180);
    fill (#1D1F32);
    rect (x + 50, y + 202, 80, 24, 4);
    fill(255);

    textAlign(LEFT, TOP);
    textSize(14);

    text("UC-" + student.code, x + 54, y + 206);
  }
  boolean hovered1() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h && mouseY >= y + headerH;
  }
  boolean hovered2() {
    return  mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + headerH;
  }
}

boolean isBreakFastTime () {
  //println ("BF:", hour (), minute (), hour() >= 6 && hour() <= 8 && minute () <= 60);
  return hour() >= 6 && hour() <= 8 && minute () <= 60;
}
boolean isLunchTime() {
  //println ("LN:", hour (), minute (), hour() >= 6 && hour() <= 8 && minute () <= 60);
  return hour() >= 12 && hour() <= 14  && minute () <= 60;
}
boolean isDinnerTime () {
  //println ("DN:", hour (), hour() >= 6 && hour() <= 8 && minute () <= 60);
  return hour () >= 18 && hour() <= 20  && minute () <= 60;
}
int nextMealHour, nextMealMin;
String Nextmeal() {
  String nextmeal = "";

  if (hour() > 5 && hour () < 8) {
    nextmeal = "Breakfast";
    nextMealHour = 8 - hour();
    nextMealMin = 60 - minute();
  } else if (hour () > 12 && hour() < 14) {
    nextmeal = "Lunch";
    nextMealHour = 14 - hour();
    nextMealMin = 60 - minute();
  } else if (hour () > 17 && hour () < 20) {
    nextmeal = "Dinner";
    nextMealHour = 17 - hour();
    nextMealMin = 60 - minute();
  }
  return nextmeal;
}
boolean ismealTime () {
  boolean ismealTime = false;
  if (isBreakFastTime()) {
    ismealTime = true;
  } else if (isLunchTime()) {
    ismealTime = true;
  } else if (isDinnerTime()) {
    ismealTime = true;
  }
  return ismealTime;
}
