// William Watabe
class Projectile {
  float x, y, w, h, speed;
  String dir;
// Spawning a projectile from a random edge
  Projectile() {
    int edge = int(random(4));
    speed = 8;

    if (edge == 0) {
      x = random(width);
      y = 0;
      dir = "down";
      w = 40;
      h = 40;
    } else if (edge == 1) {
      x = width;
      y = random(height);
      dir = "left";
      w = 40;
      h = 40;
    } else if (edge == 2) {
      x = random(width);
      y = height;
      dir = "up";
      w = 40;
      h = 40;
    } else { // left
      x = 0;
      y = random(height);
      dir = "right";
      w = 40;
      h = 40;
    }
  }

  void display() {
    fill(#39FF14);
    noStroke();
    rect(x, y, w, h);
  }
// Projectile movement
  void move() {
    if (dir.equals("right")) {
      x += speed;
    } else if (dir.equals("left")) {
      x -= speed;
    } else if (dir.equals("up")) {
      y -= speed;
    } else if (dir.equals("down")) {
      y += speed;
    }
  }
}
