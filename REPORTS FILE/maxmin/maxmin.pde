Table table = loadTable ("C:/Users/Dell/Desktop/repo/repo/data/2023/Sep.csv", "header");

String bfs [] = table.getStringRow (0);
int min = 0, max = 0;
for (int a = 1; a < bfs.length; a ++) {
  String countStr = bfs [a];
  int count = int (countStr);
  
  if (a == 1) {
    min = count;
    max = count;
  }
  
  max = max (max, count);
  
}

println (min, max);
