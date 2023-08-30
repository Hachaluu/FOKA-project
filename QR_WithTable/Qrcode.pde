import com.cage.zxing4p3.*;
ZXING4P image;
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
String prevCode = "";
String ip = "http://192.168.8.107:8080/video";
int lastTime ;

void decodeQR (Movie movie) {
  String code = image.decodeImage (false, movie);
  if (!code.equals(prevCode)) {
    println ("Code Read: ", code);
    
    prevCode = code;
    lastTime = millis();
    
    everything (code);
  }
}

void movieEvent(Movie m) {
  m.read();
}
