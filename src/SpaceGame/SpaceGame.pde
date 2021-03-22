// Space Game | December 2020 \\
// By Zoey Ng | Computer Programming 1 \\

import processing.sound.*;
SoundFile laser, explosion;
Spaceship ship;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
ArrayList<Enemy> enemies;
ArrayList<EnemyLaser> elasers;
ArrayList<PowerUp> pUps;
Timer asteroidTimer, enemyTimer, puTimer;
int score, pass, weaponCount, laserCount, enemyHealth;
boolean play;

void setup() {
  size(displayWidth, displayHeight);
  laser = new SoundFile(this, "laser.wav");
  explosion = new SoundFile(this, "explosion.wav");
  ship = new Spaceship();
  lasers = new ArrayList();
  elasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  enemies = new ArrayList();
  pUps = new ArrayList();
  asteroidTimer = new Timer(int(random(500, 1000)));
  asteroidTimer.start();
  puTimer = new Timer(7000);
  puTimer.start();
  enemyTimer = new Timer(7000);
  enemyTimer.start();
  score = 0;
  weaponCount = 1;
  laserCount = 0;
  enemyHealth = 100;
  pass = 0;
  play = false;
}

void draw() {
  noCursor();

  //Gameplay
  if (!play) {
    startScreen();
  } else {
    background(9, 10, 26);

    //Create Stars
    stars.add(new Star(int(random (width)), 0));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    //Timer for Asteroids
    if (asteroidTimer.isFinished()) {
      asteroids.add(new Asteroid(int(random(width)), -25));
      asteroidTimer.start();
    }
    // Distribution of Asteroids
    for (int i = 0; i < asteroids.size(); i++) {
      Asteroid asteroid = asteroids.get(i);
      asteroid.display();
      asteroid.move();
      //collision between spaceship and asteroids
      if (ship.asteroidIntersection(asteroid)) {
        asteroids.remove(asteroid);
        ship.health -= asteroid.health;
        score-=50;
      }
      if (asteroid.reachedBottom()) {
        pass++;
        asteroids.remove(asteroid);
      }
    }

    // Enemy ships that fire
    if (enemyTimer.isFinished()) {
      enemies.add(new Enemy(0, 100, int(random(500, 1500)), enemyHealth));
      enemyTimer.start();
    }

    // enemy ship render
    for (int i = 0; i<enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      enemy.move();
      enemy.display();
      // enemy and ship intersection
      if (ship.shipIntersect(enemy)) {
        ship.health-=enemy.healthStart;
        score+=enemy.healthStart;
        enemies.remove(enemy);
      }
      if (enemy.isFinished()) {
        elasers.add(new EnemyLaser(enemy.x, enemy.y));
        enemy.start();
      }
    }

    // enemy laser rendering
    for (int i = elasers.size()-1; i>=0; i--) {
      EnemyLaser elaser = (EnemyLaser) elasers.get(i);
      elaser.fire();
      elaser.display();
      // Enemy Laser vs. Ship
      if (ship.enemyLaserIntersect(elaser)) {
        ship.health-=elaser.power;
        elasers.remove(elaser);
      }
      if (elaser.reachedBottom()) {
        elasers.remove(elaser);
      }
    }

    //Lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.shoot();
      //collision between asteroids and lasers
      for (int j = 0; j < asteroids.size(); j++) {
        Asteroid asteroid = asteroids.get(j);
        if (asteroid.laserIntersection(laser)) {
          lasers.remove(laser);
          asteroid.health -= laser.damage;
          if (asteroid.health < 1) {
            explosion.play();
            asteroids.remove(asteroid);
            score += 100;
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    // PowerUp Distribution
    if (puTimer.isFinished()) {
      pUps.add(new PowerUp(int(random(width)), -20));
      puTimer.start();
    }
    // PowerUp rendering and collision detection
    for (int i = 0; i<pUps.size(); i++) {
      PowerUp pu = pUps.get(i);
      pu.move();
      pu.display();
      // PowerUp and ship intersection
      if (ship.puIntersect(pu)) {
        // Apply PowerUp Effects
        if (pu.pu == 0) { // Adds damage
          ship.health+=100;
        } else if (pu.pu == 1) { //Adds health
          ship.health+=500;
        } else if (pu.pu == 2) { //Adds lasers
          weaponCount++;
        } 
        pUps.remove(pu);
      }
      // dispose of rocks at bottom
      if (pu.reachedBottom()) {
        pUps.remove(pu);
      }
    }

    //Spaceship
    ship.display(mouseX, mouseY);

    infoPanel();

    //GameOver Logic
    if (ship.health<1 || pass>10) {
      play = false;
      gameOver();
    }
  }
}

void mousePressed() {
  if (play) {
    laser.play();
  }
  if (weaponCount == 1) {
    lasers.add(new Laser(ship.x, ship.y));
    laserCount++;
  } else if (weaponCount == 2) {
    lasers.add(new Laser(ship.x, ship.y));
    lasers.add(new Laser(ship.x+72, ship.y));
    lasers.add(new Laser(ship.x-72, ship.y));
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  background(9, 10, 26);

  //Create Stars
  stars.add(new Star(int(random (width)), 0));
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }

  textSize(50);
  text("Start", width/2, height/2);
  text("Press Anywhere to Continue", width/2, height/2+75);

  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-100, width, height-100);
  fill(255, 128);
  textSize(50);
  textAlign(LEFT);
  text("Score:" + score, 0, height-35);
  textAlign(CENTER);
  text("Health:" + ship.health, width/2, height-35);
  textAlign(RIGHT);
  text("Asteroids Passed:" + pass, width, height-35);
  if (pass >10) {
    fill(255, 0, 0);
  }
}

void gameOver() {
  background(9, 10, 26);
  textAlign(CENTER);
  textSize(200);
  text("GAME OVER!", width/2, height/2);
  textSize(100);
  text("Final Score:" + score, width/2, height/2+100);

  //Create Stars
  stars.add(new Star(int(random (width)), 0));
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }

  noLoop();
}
