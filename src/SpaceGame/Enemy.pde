class Enemy {
  //member variables
  int r, radius, health, x, y, speed, healthStart, random1, random2;
  boolean right;
  int savedTime; 
  int totalTime;
  PImage enemy1, enemy2;

  //contructor
  Enemy(int x, int y, int t, int health) {
    healthStart = health;
    r = 25;
    radius = 25;
    this.x = x;
    this.y = y;
    this.health = health;
    speed = 5;
    this.totalTime = t;
    random1 = int(random(1, 100));
    random2 = int(random(1, 100));
    enemy1 = loadImage("enemy1.png");
    enemy2 = loadImage("enemy2.png");
  }
  //member methods
  void display() {
    imageMode(CENTER);

    if (random1 > random2) {
      image(enemy1, x, y);
    } else {
      image(enemy2, x, y);
    }
  }

  void move() {
    x += speed;
    if (x >= width|| x <= 0) {
      speed *= -1;
      y+=50;
    }
  }
  boolean laserIntersect(Laser laser) {
    // Calculate distance
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < r + laser.radius) { 
      return true;
    } else {
      return false;
    }
  }

  void start() {
    savedTime = millis();
  }


  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
