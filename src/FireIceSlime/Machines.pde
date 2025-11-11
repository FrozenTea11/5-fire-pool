PImage m1;

void setup() {
  size(1200, 750);
  m1 = loadImage("robot.jpeg");
}
void draw() {
  background(255);
  image(m1, 0, 0);  
}
MACHINES CLASS (OTHER TAB)
class Machine {
  // Member Variables
  int x,y,w,h, health, speed;
  boolean dmg;

  // Constructor
  Machine(int x, int y, int w, int h, int speed, int health) {  
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
  dmg = false;
  }

  // Member Methods

  void display() {
  image(m1,x,y,w,h);
  if (dmg == true) {
    int(health -1);
  }
}
  void attack() {
  image(p1,x,y);
}
  void move() {
  int(x,y)
}
}
