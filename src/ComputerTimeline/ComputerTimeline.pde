// Zoey Ng | Computer Timeline
// September 15, 2020
boolean hover = false;
PFont font;

void setup () {
  size(900, 400);
  font = createFont("Times New Roman", 32);
}

void draw () {
  background(150);
  textFont(font);
  println(hover);
  drawRef();
  //TOP event one
  histEvent(100, 200, 100, 25, "ABC (1942)", "It could store data in binary form and do addition and subtraction.\r\nCreator: Clifford Berry", true);
  //BOTTOM event one
  histEvent(150, 275, 60, 25, "Harvard Mark I (1944)", "It could execute long computations automatically.\r\nCreator: IBM", false);  
  //TOP event two
  histEvent(300, 200, 100, 25, "Colossus (1944)", "It could break the code from the German Lorenz SZ-40 cipher machine.\r\nCreator: Tommy Flowers", true);
  //BOTTOM event two
  histEvent(350, 275, 30, 25, "ENIAC (1946)", "It could calculate artillery firing tables for the \r\nU.S. Army's Ballistic Research Lab.\r\nCreator: J. Presper Eckert", false);  
  //TOP event three
  histEvent(500, 200, 100, 25, "SEC (1948)", "It could help scan humans and create xrays.\r\nCreator: Bernie H. Moore", true);
  //BOTTOM event three
  histEvent(550, 275, 60, 25, "Manchester Baby (1948)", "It could show that the Williams tube \r\nwas a practical storage device.\r\nCreator: Frederic Williams", false);  
  //TOP event four
  histEvent(700, 200, 100, 25, "EDSAC (1949)", "It could provide a formal \r\ncomputing service for users.\r\nCreator: EDSAC", true);
  //BOTTOM event four
  histEvent(750, 275, 30, 25, "CSIRAC (1949)", "It could make weather \r\nforecasts, calculate mortgages, \r\nplay music, etc.\r\nCreator: Trevor Pearcey", false);
}

void drawRef() {
  //Title Text
  textSize(40);
  textAlign(CENTER);
  fill(255);
  text("Historic Computer Systems", width/2, 100);
  textSize(15);


  //Timeline
  stroke(0);
  strokeWeight(5);
  line(100, 250, 800, 250);

  //Descriptive Text
  fill(0);
  textSize(15);
  text("Hover over the button to see the description of the historic computer systems", width/2, 125);
  text("Zoey Ng | 2020", width/2, 150);
  text ("Year: 1942", 55, 250);
  text ("Year: 1949", 850, 250);
}

// history events
void histEvent(int x, int y, int w, int h, String title, String description, boolean top) {
  //Detect the location of the mouse
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);

  textAlign(LEFT);
  //Draw rectangle button
  stroke(0);
  strokeWeight(1.5);
  if (hover == true) {
    fill(130);
  } else {
    fill(255);
  }
  if (top == true) {
    rect(x, y, w+30, h, 5);
  } else {
    rect(x-50, y, w+95, h, 5);
  }

  //Draw title for rectangle
  fill(0);
  textAlign(LEFT);
  textSize(14);
  if (top == true) {
    text(title, x+5, y+20);
  } else {
    text(title, x-40, y+20);
  }
  if (hover == true) { 
    if (top == true) {
      text(description, x+20, y-35);
    } else {
      text(description, x-20, y+45);
    }
  }

  //Draw connecting line
  stroke(0);
  if (top == true) {
    line(x+20, y+25, x+35, y+50);
  } else {
    line(x-20, y, x+35, y-25);
  }
}
