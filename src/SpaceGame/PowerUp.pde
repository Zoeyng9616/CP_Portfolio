class PowerUp {
  //member variables
  int x, y, speed, radius, pu;
  color c;
  PImage damagepowerup, healthpowerup, laserpowerup;

  //contstructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 5));
    radius = 25;
    pu = int(random(3));
    damagepowerup = loadImage("damagepowerup.png");
    healthpowerup = loadImage("healthpowerup.png");
    laserpowerup = loadImage("laserpowerup.png");
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
    switch(pu) {
    case 0: //damage
      image(damagepowerup, x, y);
      break;
    case 1: //life
      image(healthpowerup, x, y);
      break;
    case 2: //laser
      image(laserpowerup, x, y);
      break;
    }
  }
}
