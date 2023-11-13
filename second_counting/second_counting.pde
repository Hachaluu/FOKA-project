import java.lang.*;

import java.util.Date;
import java.text.SimpleDateFormat;

void setup () {
  //Specifying the pattern of input date and time
  SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
  String dateString = "10-10-2023 16:18:32";
  long mealTime = 0;
  try {
    //formatting the dateString to convert it into a Date 
    Date date = sdf.parse(dateString);
    mealTime = date.getTime();
  }
  catch(Exception e) {
    e.printStackTrace();
  }

  long currentTime = System.currentTimeMillis();
//  long totalSeconds = 4000;

//long totalHours = totalSeconds / 3600;
//long totalMinutes = totalSeconds - 3600 * totalHours;
//println (totalHours);
  
}
