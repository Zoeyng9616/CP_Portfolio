class Star {
  //member variables
  int x, y, speed, diameter;
  color c;

  //contstructor
  Star(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 10));
    diameter = int(random(1,4));
    c = int(random (190,255));
  }
  
  //member methods
  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y > height) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse (x, y, diameter, diameter);
  }
}
