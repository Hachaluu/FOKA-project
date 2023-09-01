import com.cage.zxing4p3.*;
ZXING4P zxing;
PImage QRCode;

void decodeQR (String path) {
  QRCode = loadImage (path);
  String decoded = zxing.decodeImage (true, QRCode);
  code = decoded;
}

void mouseReleased () {
  selectInput ("Insert a QR Code Image", "file");
}

void file (File f) {
  path = f.getAbsolutePath();
  //println (f.getAbsolutePath());
}
