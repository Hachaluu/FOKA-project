void pageVerificationDraw () {
  gate1.draw ();
  gate2.draw ();
  gate3.draw();
  gate4.draw();

  n1.draw();
  n2.draw();
  n3.draw();
  n4.draw();

  G1.draw();
  G2.draw();
  G3.draw();
  G4.draw();
}

void homepageDraw() {
  Numbers.draw();
}

void profilepageDraw() {
  Headers.draw();
  if (pSearch.value.isEmpty()) {
    // if all students nav bar is active
    if (navbar.getActive() == 0) {
      allStudents.draw ();
    } else if (navbar.getActive() == 1) {
      cafe.draw();
    } else if (navbar.getActive() == 2) {
      noncafe.draw();
    } else if (navbar.getActive() == 3) {
      intern.draw();
    } else if (navbar.getActive() == 4) {
      special.draw();
    }
    Cafee.draw();
    internship.draw ();
    batch.draw();
  } else {
    // Draw search table here
    searchTable.draw();
    Cafee.draw();
    internship.draw ();
    batch.draw();
  }

  pSearch.draw ();
  navbar.draw();
}
void reportpageDraw() {
  report.draw();

  rSearch.draw();

  rnavbar.draw();
  
  if (rnavbar.getActive() == 0) {
    daily.draw(); 
    Year.draw();
    Day.draw();
    Month.draw ();
  } else if (rnavbar.getActive() == 1) {
    monthly.draw();
    Year.draw();
    Month.draw ();
  } else if (rnavbar.getActive() == 2) {
    annually.draw();
    Year.draw();
  }
}
void signoutpageDraw() {
}
