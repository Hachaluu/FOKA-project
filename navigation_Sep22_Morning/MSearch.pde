class Search { // Persistent Search
  PShape searchIcon, clearIcon;

  String placeholder = "Search", value = ""; // placeholder: short descriptive hint expectd of the input field  |  Value: Input text (content)
  String allowedInputChars = "";
  String LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  String NUMBERS = "0123456789";
  String SPECIAL_CHARACTERS = "!@#$%^&*()-=*.,/?;:'[]{}\"|\\`~";
  String SPACE = " ";
  String NAME_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /.";

  float x = 480, y = 180;
  float w = 500, h = 50;

  float textSize = 17;

  float aiMinBorderSize = 1.2, aiMaxBorderSize = 1.8; // ai: Activation Indicator
  float insertionPointSize = 1;
  float cornerRadius = 6;
  float iconW, iconH;
  float iconContainerD;

  int insertionPointPeriod = 500; // Blinking period of insertion point

  color accentColor = Purple;
  color unhoveredFill = white, hoveredFill = white, activeFill = white; // For container fill
  color unhoveredStroke = gray, hoveredStroke = darkGray, activeStroke = darkGray; // For activation indicator/border & text fill
  color inactivePlaceholderFill = darkGray, valueFill = superGray;
  color insertionPointStroke = superGray;
  color leadingIconFill = gray, trailingIconFill = darkGray;
  color iconContainerHoverFill = almostGray;

  boolean active;
  boolean iconContainerHovered;

  Fonts fonts;

  Periodically ipPeriod; // ip: Insertion Point

  void init (String placeholder, float x, float y, float w, float h) {
    this.placeholder = placeholder;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    ipPeriod = new Periodically (insertionPointPeriod);
    allowedInputChars = LETTERS + NUMBERS + SPACE + SPECIAL_CHARACTERS;
    fonts = new Fonts ();

    searchIcon = loadShape ("data/icons/search.svg");
    searchIcon.disableStyle();
    clearIcon = loadShape ("data/icons/clear.svg");
    clearIcon.disableStyle();

    iconW = h*0.3;
    iconH = searchIcon.height*(iconW/searchIcon.width);

    iconContainerD = h*0.8;
  }

  Search (String placeholder, float x, float y, float w, float h) {
    init (placeholder, x, y, w, h);
  }
  Search (String placeholder, float x, float y) {
    init (placeholder, x, y, w, h);
  }

  void draw () {
    // For Outlined Text Field, Activation Indicator
    strokeCap (SQUARE);
    stroke (hovered ()? hoveredStroke : unhoveredStroke);
    if (active) stroke (activeStroke);
    strokeWeight (active? aiMaxBorderSize : aiMinBorderSize);

    // Container
    rectMode (CORNER);
    fill (hovered ()? hoveredFill : unhoveredFill, 200);
    rect (x, y, w, h, cornerRadius); 

    // Icon container : Trailing icon
    float whitespaceD = (h - iconContainerD)/2;
    float lGap = h + whitespaceD;
    float scx = x + w - lGap/2;
    float scy = y + h/2;
    iconContainerHovered = rectHovered (scx, scy, iconContainerD, CENTER);

    rectMode (CENTER);
    noStroke ();
    noFill ();
    if (iconContainerHovered && !value.isEmpty()) fill (iconContainerHoverFill); 
    rect (scx, scy, iconContainerD, iconContainerD, cornerRadius);

    // Icons
    // li: Leading Icon
    float lix = x + lGap/2;
    float liy = y + h/2;
    noStroke ();
    shapeMode (CENTER);
    fill (leadingIconFill);
    shape (searchIcon, lix, liy);

    // ti: Trailing Icon
    float tix = x + w - lGap/2;
    float tiy = liy;
    fill (trailingIconFill);
    if (!value.isEmpty ()) shape (clearIcon, tix, tiy);


    // Placeholder text
    textFont (fonts.roboto.medium);
    textSize (textSize);
    float lx = x + lGap;
    float ly = y + h/2 - textDescent ()/2;

    textAlign (LEFT, CENTER);
    fill (inactivePlaceholderFill);
    if (!active && value.isEmpty ()) text (placeholder, lx, ly);

    // Value text
    textFont (fonts.roboto.medium);
    textSize (textSize);    
    textAlign (LEFT, CENTER);
    fill (valueFill);
    String displayableValue = value;
    float ipX = lx + insertionPointSize + textWidth (value);
    float ipW = w - 2*lGap - insertionPointSize;
    if (ipX  >= x + w - lGap) { // Insertion point has reached bound limit within field
      while (textWidth (displayableValue) > ipW) {
        if (displayableValue.length () > 0) displayableValue = displayableValue.substring (1, displayableValue.length ());
      }
    }
    if (!value.isEmpty ()) text (displayableValue, lx, ly);
    
    // Insertion point | L: Length | W: Width of bounding box for the insertion point
    ipX = constrain (ipX, lx + insertionPointSize, x + w - lGap);
    float ipL = (textDescent () + textAscent ())*0.9;
    float ipY = y + (h - ipL)/2;
    if (active) stroke (insertionPointStroke);
    strokeWeight (insertionPointSize);
    if (active && ipPeriod.getState()) line (ipX, ipY, ipX, ipY + ipL);
  }

  boolean hovered () {
    return rectHovered (x, y, w, h, CORNER);
  }
  boolean rectHovered (float x, float y, float w, float h, float orientation) {
    return (((orientation == CORNER && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
      || (orientation == CENTER && mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2))? true : false);
  }
  boolean rectHovered (float x, float y, float d, float orientation) {
    return (((orientation == CORNER && mouseX >= x && mouseX <= x + d && mouseY >= y && mouseY <= y + d)
      || (orientation == CENTER && mouseX >= x - d/2 && mouseX <= x + d/2 && mouseY >= y - d/2 && mouseY <= y + d/2))? true : false);
  }

  void acceptNumbersOnly () {
    allowedInputChars = NUMBERS;
  }

  void mousePressed () {
    if (hovered ()) { 
      active = true;
      
      if (iconContainerHovered) value = "";
    } else active = false;
  }

  void keyPressed () {
    if (active == true) {
      if (allowedInputChars.contains (str (key)))
        value += key;
      else if (value.length () > 0 && keyCode == BACKSPACE) {
        int index = value.length () - 1;
        value = value.substring (0, index);
      } else if (keyCode == ENTER)
        active = false;
    }
  }
}
