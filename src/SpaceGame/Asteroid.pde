class Asteroid {
  //member variables
  int x, y, health, speed, radius, random;
  char displayMode;
  color c;
  PImage asteroid1, asteroid2, asteroid3, asteroid4, asteroid5;

  //contstructor
  Asteroid(int x, int y) {
    this.x = x;
    this.y = y;
    health = int(random(50-100));
    speed = int(random(5, 7));
    radius = 25;
    displayMode = '1';
    c = 255;
    random = int(random(1, 5));
    asteroid1 = loadImage("asteroid1.png");
    asteroid2 = loadImage("asteroid2.png");
    asteroid3 = loadImage("asteroid3.png");
    asteroid4 = loadImage("asteroid4.png");
    asteroid5 = loadImage("asteroid5.png");
  }

  //member methods
  void move() {
    y+=speed;
  }

  //collision for asteroids and lasers
  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < radius + laser.radius) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    if (random==5) {
      image(asteroid5, x, y);
    } else if (random==4) {
      image(asteroid4, x, y);
    } else if (random==3) {
      image(asteroid3, x, y);
    } else if (random==2) {
      image(asteroid2, x, y);
    } else {
      image(asteroid1, x, y);
    }
  }
}
