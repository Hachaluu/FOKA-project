PFont helveticaBold, helveticaReg, helveticaMed;
PFont MontserratBold, MontserratReg, MontserratSemiBold, MontserratMed ;
PFont RobotoBold, RobotoMed, RobotoReg;

void FONTS() {
  helveticaBold = createFont ("data/fonts/Helvetica Now Display/HelveticaNowDisplay-Bold.ttf", 12);
  helveticaReg = createFont ("data/fonts/Helvetica Now Display/HelveticaNowDisplay-Regular.ttf", 12);
  helveticaMed = createFont ("data/fonts/Helvetica Now Display/HelveticaNowDisplay-Medium.ttf", 12);

  MontserratBold = createFont ("data/fonts/montserrat/Montserrat-Bold.ttf", 12);
  MontserratSemiBold = createFont ("data/fonts/montserrat/Montserrat-SemiBold.ttf", 12);
  MontserratMed = createFont ("data/fonts/montserrat/Montserrat-Medium.ttf", 12);

  RobotoBold = createFont ("data/fonts/Roboto/Fonts/roboto-bold.ttf", 12);
  RobotoMed = createFont ("data/fonts/Roboto/Fonts/roboto-medium.ttf", 12);
  RobotoReg = createFont ("/data/fonts/Roboto/Fonts/roboto-regular.ttf", 17);
}

class Fonts {
  Roboto roboto;

  Fonts () {
    roboto = new Roboto ();
  }
}

class Roboto {
  PFont regular, medium, bold;

  Roboto () {
    regular = createFont ("/data/fonts/Roboto/Fonts/roboto-regular.ttf", 17);
    medium = createFont ("/data/fonts/Roboto/Fonts/roboto-medium.ttf", 17);
    bold = createFont ("/data/fonts/Roboto/Fonts/roboto-bold.ttf", 17);
  }
}

class Caros {
  PFont regular, medium, bold;

  Caros () {
    regular = createFont ("/data/fonts/caros/caros-regular.otf", 17);
    medium = createFont ("/data/fonts/caros/caros-medium.otf", 17);
    bold = createFont ("/data/fonts/caros/caros-bold.otf", 17);
  }
}
