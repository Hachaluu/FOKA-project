import com.cage.zxing4p3.*;
ZXING4P zxing;

PImage  QRCODE;

void setup() {

size (400, 400);
  zxing = new ZXING4P();

QRCODE = loadImage ("1.tif");
 
   String decode = zxing.decodeImage(true,QRCODE);

    println (decode);
  
}
