class Button {
  // Member Variables (Memory Reservation)
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean hover;

  //Contructor
  Button (int tempX, int tempY, int tempW, int tempH, String tempVal) {
    x  = tempX;   
    y  = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = #1C1C1C;
    c2 = #383838;
    hover = false;
  }

  //Display Method
  void display () {
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }

    strokeWeight(2);
    stroke(84, 84, 84);
    rect(x, y, w, h);
    fill(0);
    textSize(25);
    textAlign(CENTER);
    fill(255);
    text(val, x+w/2, y+h/2);
  }

  //Mouse Interaction Method
  void hover () {
    hover = mouseX > x && mouseX< x+w && mouseY > y && mouseY < y+h;
  }
}
