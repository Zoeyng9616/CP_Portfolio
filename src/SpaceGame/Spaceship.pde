class Spaceship {
  //member variables
  int r, x, y, health, lives, radius;
  PImage spaceship;

  //contructor
  Spaceship() {
    r = 25;
    x = 0;
    y = 0;
    health = 1000;
    lives = 3;
    radius = 25;
    spaceship = loadImage("spaceship.png");
  }

  //member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    imageMode(CENTER);
    image(spaceship, x, y);
  }

  boolean enemyLaserIntersect(EnemyLaser elaser) {
    // Calculate distance
    float distance = dist(x, y, elaser.x, elaser.y); 

    // Compare distance to radius
    if (distance < r + elaser.r) { 
      return true;
    } else {
      return false;
    }
  }

  //collision for asteroids and spaceship
  boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist(x, y, asteroid.x, asteroid.y);
    if (distance < radius + asteroid.radius) {
      return true;
    } else {
      return false;
    }
  }

  boolean puIntersect(PowerUp pu) {
    // Calculate distance
    float distance = dist(x, y, pu.x, pu.y);
    if (distance < r + pu.radius) { 
      return true;
    } else {
      return false;
    }
  }

  boolean shipIntersect(Enemy enemy) {
    // Calculate distance
    float distance = dist(x, y, enemy.x, enemy.y); 

    // Compare distance to radius
    if (distance < r + enemy.r) { 
      return true;
    } else {
      return false;
    }
  }
}
