class Machine {
  // Member Variables
  int x,y,w,h, health, speed;
  PImage l;
  boolean dmg;

  // Constructor
  Machine(int x, int y, int w, int h, int speed, int health, PImage l1) {
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
  dmg = false;
  }


  // Member Methods

  void display() {
  image(l1,x,y);
}
  void attack() {
  image(x,y);
}
  void move() {
  int(x,y)
}
