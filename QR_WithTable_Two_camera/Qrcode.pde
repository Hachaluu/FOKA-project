import com.cage.zxing4p3.*;
ZXING4P image;
ZXING4P image_two;
//ZXING4P zxing;

//PImage QRCode;

//void decodeQR (String path) {
//  QRCode = loadImage (path);
//  String decoded = zxing.decodeImage (true, QRCode);
//  code = decoded;
//}

//void mouseReleased () {
//  selectInput ("Insert a QR Code Image", "file");
//}

//void file (File f) {
//  path = f.getAbsolutePath();
//  //println (f.getAbsolutePath());
//}


import processing.video.*;
Movie movie;
Movie movie_two;
String prevCode = "";

String prevCode_two = "";
String ip_two = "http://192.168.43.93:8080/video";
String ip = "http://192.168.43.92:8080/video";

int lastTime ;
int lastTime_two ;
void decodeQR (Movie movie) {
  String code = image.decodeImage (false, movie);
  if (!code.equals(prevCode)) {
    println ("Source 1: Code Read: ", code);
    
    prevCode = code;
    lastTime = millis();
    
    everything (code);
  }
}
void decodeQR_two (Movie movie_two) {
   String code_two = image_two.decodeImage (false, movie_two);
   if (!code_two.equals(prevCode_two)) {
    println ("Source 2: Code Read: ", code_two);
    
    prevCode_two = code_two;
    lastTime_two = millis();
    
    everything (code_two);
  }
}

void movieEvent(Movie m) {
  m.read();
}
