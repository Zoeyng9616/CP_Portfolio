Button[] numButtons = new Button[10];
Button[] optButtons = new Button[15];
String dVal= "0.0";

void setup() {
  size(400, 600);
  //numButtons
  numButtons[0] = new Button(80, 500, width/5, height/6, "0");
  numButtons[1] = new Button(80, 400, width/5, height/6, "1");
  numButtons[2] = new Button(160, 400, width/5, height/6, "2");
  numButtons[3] = new Button(240, 400, width/5, height/6, "3");
  numButtons[4] = new Button(80, 300, width/5, height/6, "4");
  numButtons[5] = new Button(160, 300, width/5, height/6, "5");
  numButtons[6] = new Button(240, 300, width/5, height/6, "6");
  numButtons[7] = new Button(80, 200, width/5, height/6, "7");
  numButtons[8] = new Button(160, 200, width/5, height/6, "8");
  numButtons[9] = new Button(240, 200, width/5, height/6, "9");

  //optButtons
  optButtons[0] = new Button(0, 500, width/5, height/6, "?");
  optButtons[1] = new Button(160, 500, width/5, height/6, ".");
  optButtons[2] = new Button(240, 500, width/5, height/6, "=");
  optButtons[3] = new Button(320, 500, width/5, height/6, "+");
  optButtons[4] = new Button(0, 400, width/5, height/6, "?");
  optButtons[5] = new Button(320, 400, width/5, height/6, "-");
  optButtons[6] = new Button(0, 300, width/5, height/6, "?");
  optButtons[7] = new Button(320, 300, width/5, height/6, "*");
  optButtons[8] = new Button(0, 200, width/5, height/6, "?");
  optButtons[9] = new Button(320, 200, width/5, height/6, "/");
  optButtons[10] = new Button(0, 100, width/5, height/6, "AC");
  optButtons[11] = new Button(80, 100, width/5, height/6, "←");
  optButtons[12] = new Button(160, 100, width/5, height/6, "→");
  optButtons[13] = new Button(240, 100, width/5, height/6, "⌫");
  optButtons[14] = new Button(320, 100, width/5, height/6, "±");
}

void draw() {
  updateDisplay();
  performCalculation();

  background(28, 28, 28);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i = 0; i<optButtons.length; i++) {
    optButtons[i].display();
    optButtons[i].hover();
  }
}

void mousePressed() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].hover) {
      dVal += numButtons[i].val;
    }
  }
}


void updateDisplay() {
  fill(28, 28, 28);
  rect(0, 0, 400, 100);
  fill(255);
  text(dVal, width-20, height/6);
}

void performCalculation() {
}
