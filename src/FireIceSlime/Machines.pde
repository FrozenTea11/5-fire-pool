class Machine {
  // Member Variables
  int x,y,w,h, health, speed;
  PImage m;
  boolean dmg;

  // Constructor
  Machine(int x, int y, int w, int h, int speed, int health, PImage m1) 
  m1 = loadImage("
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
  dmg = false;
  }


  // Member Methods

  void display() {
  image(m1,x,y);
  if (dmg == true) {
    int(health -1);
  }
}
  void attack() {
  image(x,y);
}
  void move() {
  int(x,y)
}
