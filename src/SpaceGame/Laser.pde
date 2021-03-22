class Laser {
  //member variables
  int x, y, speed, radius, damage;
  color c;

  //contstructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(10,20));
    c = #007DFF;
    radius = 4;
    damage = int(random(10, 50));
  }

  //member methods
  void shoot() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y < -5) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 5, 20, 2);
  }
}
