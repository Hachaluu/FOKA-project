Table table = loadTable ("C:/Users/Dell/Desktop/repo/data/2023/Sep.csv", "header");

String rName = "Breakfast";
int rIndex = table.findRowIndex (rName, 0);
String bfs [] = table.getStringRow (rIndex);
IntList counts = new IntList ();

for (int a = 1; a < bfs.length; a ++) {
  String countStr = bfs [a];
  int count = int (countStr);
  
  counts.append (count);
}

println (counts.min(), counts.max ());
