
import com.cage.zxing4p3.*;
ZXING4P imageQ, image_two;

String prevCode = "";

String prevCode_two = "";

int lastTime_two ;
void decodeQR (Movie movie1) {
  String code = imageQ.decodeImage (false, movie1);
  if (!code.equals(prevCode)) {
     //String tempo = code;
    //code = "code";
      prevCode =  code;
    //lastTime = millis();  
    //return code;
    
  }
  if (prevCode != code){
  fill(0);
  textSize(30);
  textAlign(LEFT, CENTER);
  text ("Source 1: Code Read:" + code, 401, 200);
    
  }
}
