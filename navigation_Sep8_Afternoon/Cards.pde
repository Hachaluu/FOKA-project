import com.cage.zxing4p3.*;

String cafee = "";
String cafeUsage = "";
String gender = "";
class Cards {
  Movie movie;
  ZXING4P zxing;

  String prevCode = "";

  String prevCode_two = "";

  int lastTime ;
  int lastTime_two ;

  Student student;

  String label1, label2, label3;

  float x, y;
  float w = 440, h = 260;
  float headerH = 39;
  float radius = 4;

  int state = 0; // 0: Feed | 1: Student Details | 2: Text (Disconnected/Fetching Feed ...)

  PImage image;
  color accentColor;

  Cards (float x, float y, String label1, String label2, String label3, Movie movie, color accentColor) { // Constructor
    this.x = x;
    this.y = y;

    this.label1 = label1;
    this.label2 = label2;
    this.label3 = label3;

    this.movie = movie;

    this.accentColor = accentColor;

    zxing = new ZXING4P ();
  }

  void setStudentCode (String code) {
    student = new Student (code);
  }

  void draw () {
    // Container
    noStroke ();
    fill (purpleDark);
    rect (x, y, w, h, radius);

    if (movie != null && movie.height != 0 && movie.width != 0) {
      //copy (x, y, w, h, x + 401, y + 171, w, h);
      if (millis() - lastTime >= 5000) {
        state = 0;
      }
      try { 
        //decodeQR (movie);
        String code = zxing.decodeImage (false, movie);

        if (!code.equals(prevCode)) {
          println ("Source 1: Code Read: ", code);
          prevCode = code;
          lastTime = millis();  
          student = new Student (code);

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
      }
    } else if (state == 3) {
    } else if (state == 1) {
      //fill (255);
      //intern();
      if (student.exists()){
      studentid(student, x, y);
      }else if (!student.exists()){
      fill(255);
      text("Invalid code", x + 172, y + 125);
      } //text("Student detail appears here [" + student.code + "]", x + w/2, y + h/2 - headerH);
    }
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
    fill (0);
    line (0, 12, 1366, 0);
    if (hovered1()) {
      stroke(0, 0, 255, 255*0.50);
      noFill();
      rect (x, y, w, h, radius);
    }
    if (hovered2()) {
      stroke(accentColor, 255 * 0.50);
      noFill();
      rect (x, y, w, headerH, radius, radius, 0, 0);

      //Search area
    }
  }
  void studentidcard() {
    if (student.getInternship().equals("1") ) {
      cafeUsage = "Cafe User (N)";
    } else if (student.getInternship() .equals("2")) {
      cafeUsage = "Cafe User (S)";
    } else {
      cafeUsage = "Non cafe ";
    }
    if (student.getgender().equals("F")) {
      gender = "Female";
    } else if (student.getgender().equals ("M")) {
      gender = "Male";
      
    }
    
  }
  void studentid (Student student, float x, float y) {
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

    text("UC-" + code, x + 54, y + 206);
  }
  boolean hovered1() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h && mouseY >= y + headerH;
  }
  boolean hovered2() {
    return  mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + headerH;
  }
}
