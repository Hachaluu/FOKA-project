import com.cage.zxing4p3.*;

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
      } else if (millis() - lastTime <= 5000) {
        state = 1 ;
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
      fill (255);
      text("Student detail appears here [" + student.code + "]", x + w/2, y + h/2 - headerH);
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

    //Search area
  }
}
