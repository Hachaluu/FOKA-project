String dataPath = "C:/Users/Dell/Desktop/desktop/project/project/DATA_2.csv";

String daysofTheMonth [] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14","15","16","17", "18", "19", "20", "21", "22","23", "24", "25", "26", "27", "28", "29", "30", "31"};
String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

String stat[] = {"Stat", "Breakfast", "Lunch", "Dinner", "Average", "Percentage"};
String monthlyTablePath;

Table data, monthlyTable;
String colName ;

void setup () {
  generateDailyReport ();
  
}
