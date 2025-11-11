ArrayList<Machine> machines = new ArrayList<Machine>();

void setup() {
  size(1200, 750);
}
void draw() {
  background(255);
  for (int i = 0; i < machines.size(); i++) {
    Machine m = machines.get(i);
    m.display();
    m.move();
  }
}

void mousePressed() {
  machines.add(new Machine(mouseX, mouseY));
}


MACHINE CLASS (OTHER TAB)

class Machine {
  // Member Variables
  int x, y, w, h, speed, health;
  boolean dmg;

  // Constructor
  Machine(int x, int y) {
    this.x = x;
    this.y = y;
    w = 15;
    h = 30;
    speed = 5;
    health = 5;
    dmg = false;
  }

  // Member Methods

  void display() {
    fill(125);
    rect(x, y, w, h);
  }

  void move() {
    y++;
    if (y>height) {
      y = 0;
    }
  }
}
