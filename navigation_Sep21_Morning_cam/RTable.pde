import java.util.List;
import java.util.Arrays;

class RTable {
  // Table Container
  float x, y;
  float w = 1064, h = 528;
  float cornerRadius = 14;
  float colGapW = 12, rowH = 52;
  float scrollBarW = 8;
  float scrollBarTrackH, scrollBarTrackY;
  float scrollBarThumbY, scrollBarThumbH;

  float toolbarH = 0, headerH = 52;
  float rowsStartYOriginal, rowsStartY;
  float scrollFactor = 8;
  float rowsStartYi;

  int atOnceDrawableRows = 8;
  int lastSelectedRow = -1;

  String headersLabels [];

  RRow header;
  Toolbar toolbar;

  List <RRow> rows;

  RTable (String headersLabels [], float x, float y) {
    this.headersLabels = headersLabels;
    header = new RRow (headersLabels);
    header.setHeader ();

    this.x = x;
    this.y = y;

    rows = new ArrayList <RRow> ();
    toolbar = new Toolbar (x, y, w, toolbarH);

    rowsStartYOriginal = y + toolbarH + headerH;
    rowsStartY = rowsStartYOriginal;
    rowsStartYi = rowsStartY;

    scrollBarTrackY = y + toolbarH;
    scrollBarThumbY = scrollBarTrackY;
    scrollBarTrackH = h - toolbarH;
  }
  void addRow (String rowLabels []) {
    RRow row = new RRow (rowLabels);    
    addRow (row);
  }
  void addRow (RRow row) {
    rows.add (row);
  }

  void clearRowEntries () {
    rows = new ArrayList <RRow> ();
  }

  void draw () {
    // Table Container
    rectMode (CORNER);
    fill (white);
    noStroke ();
    rect (x, y, w, h, cornerRadius);

    // Rows
    textFont (fonts.roboto.medium);
    for (int a = 0; a < rows.size (); a ++) {
      float rowY = rowsStartYi + rowH * a;
      if (rowY > rowsStartYOriginal - rowH) {
        rows.get (a).draw (x, rowY);
      }
    }
    rowsStartYi = lerp (rowsStartYi, rowsStartY, 0.05);

    // Toolbar
    toolbar.draw ();

    // Header
    fill (white);
    noStroke ();
    rect (x, y + toolbarH, w - scrollBarW - colGapW, header.h);
    textFont (fonts.roboto.bold);
    header.draw (x, y + toolbarH);

    // Table Container Outline
    stroke (grayMid);
    strokeWeight (1);
    noFill ();
    rect (x, y, w, h, cornerRadius);

    // Table Curtain: Bottom
    noStroke ();
    fill (bluePale);
    rect (x, 740, w, 29);

    // Scrollbar
    if (isScrollable ()) {
      // Scroll Track
      noStroke ();
      noFill ();
      rect (x + w - colGapW, scrollBarTrackY, scrollBarW, scrollBarTrackH, scrollBarW/2);

      // Scroll Thumb
      scrollBarThumbH = scrollBarTrackH * atOnceDrawableRows*1.0 / rows.size ();
      stroke (grayDark);
      fill (gray);
      rect (x + w - scrollBarW, scrollBarThumbY, scrollBarW, scrollBarThumbH, scrollBarW/2);
    }
  }

  boolean isScrollable () {
    return rows.size () - atOnceDrawableRows > 0;
  }

  boolean hovered () {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }

  int [] getActiveIndexes () {
    int activeIndexes [] = new int [0];

    for (int a = 0; a < rows.size (); a ++) {
      if (rows.get (a).active) {
        activeIndexes = append (activeIndexes, a);
      }
    }

    return activeIndexes;
  }

  void setActiveIndexes (int activeIndexes []) {
    for (int a = 0; a < activeIndexes.length; a ++) {
      rows.get (a).active = true;
    }
    
  }

  void mousePressed (MouseEvent e) {
    if (!e.isShiftDown() && !e.isControlDown()) {
      for (int s = 0; s < rows.size (); s ++) {
        if (rows.get (s).hovered ()) {
          rows.get (s).activate ();
          lastSelectedRow = s;

          for (int a = 0; a < rows.size (); a ++) {
            if (a != s) {
              rows.get (a).deactivate ();
            }
          }

          break;
        }
      }
    } else if (e.isControlDown()) {
      for (int s = 0; s < rows.size (); s ++) {
        if (rows.get (s).hovered ()) {
          rows.get (s).flipState ();
          lastSelectedRow = s;

          break;
        }
      }
    } else if (e.isShiftDown()) {
      int nowSelectedRow = -1;
      for (int s = 0; s < rows.size (); s ++) {
        if (rows.get (s).hovered ()) {
          nowSelectedRow = s;
          rows.get (s).activate ();
          break;
        }
      }

      if (nowSelectedRow != -1 && lastSelectedRow != -1) {
        int from = min (lastSelectedRow, nowSelectedRow);
        int to = max (lastSelectedRow, nowSelectedRow);

        for (int s = from; s < to; s ++) {
          rows.get (s).flipState ();
        }

        rows.get (from).activate ();
      } else if (nowSelectedRow != -1) {
        rows.get (nowSelectedRow).activate ();
      }

      lastSelectedRow = nowSelectedRow;
    }

    // Deactivates all
    //if (hovered () && Arrays.equals (activeIndexesBefore, getActiveIndexes ()) && !toolbar.hovered ()) {
    //  for (int s = 0; s < rows.size (); s ++) {
    //    rows.get (s).deactivate ();
    //  }
    //}
  }

  void mouseWheel (MouseEvent e) {
    if (!isScrollable ())
      return;
    rowsStartYi -= e.getCount () * scrollFactor;

    float minRowsStartY = rowsStartYOriginal - (rows.size () - atOnceDrawableRows) * rowH;
    float maxRowsStartY = rowsStartYOriginal;
    rowsStartYi = constrain (rowsStartYi, minRowsStartY - headerH, maxRowsStartY + headerH);
    rowsStartY  = constrain (rowsStartYi, minRowsStartY, maxRowsStartY);

    float minScrollThumbStartY = scrollBarTrackY + scrollBarTrackH - scrollBarThumbH;
    float maxScrollThumbStartY = scrollBarTrackY;
    scrollBarThumbY = map (rowsStartY, minRowsStartY, maxRowsStartY, minScrollThumbStartY, maxScrollThumbStartY);
  }
}

class RRow {  
  float colWs [] = {56, 150, 70, 70, 70, 70, 126, 86, 89, 143};
  float colGapW = 12, h = 52;
  float totalW = 0;
  float startX;
  float x, y;

  color hoveredFill = grayLight, pressedFill = blueLight, activeFill = blueLight;

  String labels [];

  boolean isHeader;
  boolean active;

  RRow (String labels []) {
    this.labels = labels;

    for (float colW : colWs) {
      totalW += colW + colGapW;
    }
    totalW -= colGapW;
  }

  void setHeader () {
    isHeader = true;
  }
  void activate () {
    active = true;
  }
  void deactivate () {
    active = false;
  }
  void flipState () {
    active = !active;
  }

  boolean isActive () {
    return active;
  }

  void draw (float x, float y) {
    this.x = x;
    this.y = y;

    startX = x + colWs [0] + colGapW;

    if (!isHeader) {
      noStroke ();
      if (hovered ()) {
        if (mousePressed) {
          fill (pressedFill);
        } else {
          fill (hoveredFill);
        }
      } else {
        noFill ();
      }

      if (active) {
        fill (activeFill);
      }

      rect (x, y, totalW, h);
    }

    noStroke ();
    textSize (15);
    textAlign (LEFT, CENTER);
    for (int a = 0; a < labels.length; a ++) {      
      fill (graySuper);
      text (labels [a], startX, y + h/2 - textDescent ()/2);

      startX += colWs [a + 1] + colGapW;
    }

    if (!isHeader && !active) {
      stroke (gray);
      strokeWeight (1);
      line (x, y, startX - colGapW, y);
    }
  }

  boolean hovered () {
    return mouseX  > x && mouseX < x + totalW && mouseY > y && mouseY < y + h;
  }
}

class RToolbar {
  float x, y;
  float w = 1064, h = 528;
  float cornerRadius = 14;

  RToolbar (float x, float y, float w, float h) {
    this.x = x;
    this.y = y;

    this.w = w;
    this.h = h;
  }

  void draw () {
    // Toolbar
    fill (white);
    noStroke ();
    rect (x, y, w, h, cornerRadius, 0, 0, 0);
  }

  boolean hovered () {
    return mouseX  > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
