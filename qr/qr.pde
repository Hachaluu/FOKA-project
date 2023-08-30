import org.apache.commons.lang3.RandomStringUtils;

import com.cage.zxing4p3.*;
ZXING4P zxing;

PImage qrCode;




void setup () {
  size (300, 300);
  
  zxing = new ZXING4P ();
   for (int x = 0; x < 50; x ++){
  String code = RandomStringUtils.randomAlphanumeric (5).toUpperCase ();
println (code);  
  qrCode = zxing.generateQRCode(code, 300, 300);
  image (qrCode, 0, 0);
  
  saveFrame (code+".png");
  
  exit ();
}
}
