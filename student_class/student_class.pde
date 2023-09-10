import static javax.swing.JOptionPane.*;

PImage image;

int x = 848;
int y = 171;
String code = showInputDialog ("Please enter you code", "HOEPY");

Table table;

String cafee;
String cafeUsage;

Student student;

String tablePath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

void setup () {
  image = loadImage("C:/Users/Dell/Desktop/image/person.png");
  fullScreen();
  table = loadTable (tablePath, "header");
  student = new Student (code);
  intern();
  if (student.exists()== true) {
    println ("valid code: " + student.getcode());
    println ("Name: ", student.getName ());
    println ("Department: ", student.getDepartment());
    if (student.getcafestatus().equals("1")) {
      println ("Cafe status: ", " Cafe user");
    } else println ("Cafe status: ", "Non cafe");
    if (student.getInternship() .equals("1")) {
      println ("INternship: ", "N");
    } else if (student.getInternship ().equals("0")) {
      println ("Internship: ", "Not intern student");
    } else println ("Internship", "S");
    println ("School Year: " +student.getSchoolyear());
    println ("DOB: "+student.getDOB());
  } else println ("Invalid code");
}
void draw() {
  noStroke();
  fill(#1D1F32);
  rect (x, y, 439, 260, 4);
  rect (x + 30, y + 69, 121, 162, 4);
  fill(#282843);  
  rect (x, y, 440, 49);
  image(image, x + 30, y + 69);
  fill (255);
  textAlign(LEFT, TOP);

  text (student.getName(), x + 171, y + 99);
  text ("Female", x + 171, y + 126);
  text (student.getDepartment(), x + 171, y +153);
  text (cafeUsage, x + 171, y + 180);
  fill (#1D1F32);
  rect (x + 50, y + 202, 80, 24, 4);
  fill(255);
  
  textAlign(LEFT, TOP);
  textSize(14);
  
  text("UC-" + code, x + 54, y + 206);
}

void intern() {
  if (student.getInternship().equals("1") ) {
    cafeUsage = "Cafe User (N)";
  } else if (student.getInternship() .equals("2")) {
    cafeUsage = "Cafe User (S)";
  } else if (student.getInternship() .equals("0")) {
    cafeUsage = "Non cafe ";
  }
}
