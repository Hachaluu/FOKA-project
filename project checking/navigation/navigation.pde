
Navigationbar N, n1, n2, n3, n4, n5;
void setup() { 
  IMAGE();
  fullScreen ();
   MontserratBold = createFont ("data/fonts/montserrat/Montserrat-Bold.ttf",12);
 MontserratSemiBold = createFont ("data/fonts/montserrat/Montserrat-SemiBold.ttf",12);

  N = new Navigationbar(68, 171, images, "Search", 1089, symbolx,purpledark);
  n1 = new Navigationbar(68, 225, "", 272, symbolT,red);
  n2 = new Navigationbar(68, 279, "", 230, symbolT,green);
  n3 = new Navigationbar(68, 333, "", 294, symbolT,lightblue);
  n4 = new Navigationbar(68, 387, "", 302, symbolN,yellow);
}
void draw() {
  background (background);
  N.draw();
  n1.draw();
  n2.draw();
  n3.draw();
  n4.draw();
}
