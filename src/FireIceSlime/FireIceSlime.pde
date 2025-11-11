Dragon dragon;

void setup() {
  size(1200, 750);
  background(#FFFFFF);
  dragon = new Dragon();
  
}

void draw() {
  background(#FFFFFF);
  dragon.display();
  dragon.fireball();
  dragon.displayFireballs();
  dragon.move();
}
