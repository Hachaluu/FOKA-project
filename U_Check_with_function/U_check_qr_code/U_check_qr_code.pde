import com.cage.zxing4p3.*;
ZXING4P zxing;

PImage  QRCode;

void setup() {

size (400, 400);
  zxing = new ZXING4P();
for (int x = 1; x <= 10; x ++){
QRCode = zxing.generateQRCode(str(x), 400, 400);
    image (QRCode, 0, 0);
    saveFrame (str(x));
}
}
