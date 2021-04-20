float x, y, strokeW, pointCount;
void setup() {
  size(displayWidth, displayHeight);
  background(0);
  x = random(width);
  y = random(height);
}

void draw() {
  stroke(random(255), random(255), random(255));
  strokeWeight(random(strokeW));
  strokeW = random(13, 17);
  pointCount = random(40, 55);
  if (x > width || x < 0 || y > height || y < 0) {
    x = random(width);
    y = random(height);
  } else {
    if (random(100) > 78) {
      moveUp(x, y, pointCount);
    } else if (random(100) > 72) {
      moveLeft(x, y, pointCount);
    } else if (random(100) > 65) {
      moveDown(x, y, pointCount);
    } else if (random(100) > 45) {
      moveRight(x, y, pointCount);
    }
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    x = startX+i;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    x = startX-i;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    y = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY+i);
    y = startY+i;
  }
}
