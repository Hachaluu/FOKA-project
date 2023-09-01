
void updateTime () {
  isbreakfasttime = hour() >= 6 && hour() <= 8;
  islunchtime = hour() >= 12 && hour() <= 14;
  isdinnertime = hour() >= 18 && hour() <= 20;
}

void updateDateStamp () {
  breakfastTime = getDateStamp()+"-"+"BF";
  lunchTime = getDateStamp()+"-"+"LN";
  dinnerTime = getDateStamp()+"-"+"DN";
}


String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return day () + "-" + monthsOfTheYear [month () - 1] + "-" + year ();
}
