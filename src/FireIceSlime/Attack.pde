class Attack {
  // Member Variables
  int x, y, w, h, speed;


  // Constructor
  Attack(int x, int y) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 3;
    speed = int(5);
  }



  // Member Methods
  void display() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }

  void move() {
    x+= speed;
  }
}

