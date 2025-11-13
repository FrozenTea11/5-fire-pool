class Attack {
  int x, y, w, h, speed;
  String dir; 

  Attack(int x, int y, String dir) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    w = 30;
    h = 3;
    speed = 5;
  }

  void display() {
    fill(#D6FFFA);
    rect(x, y, w, h);
  }

  void move() {
    if (dir.equals("right")) {
      x += speed;
    } else if (dir.equals("left")) {
      x -= speed;
    } else if (dir.equals("up")) {
      h = 30;
      w = 3;
      y -= speed;
    } else if (dir.equals("down")) {
      h = 30;
      w = 3;
      y += speed;
    }
  }
}

