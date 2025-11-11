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

Dragon tab: 
class Dragon {
  boolean up;
  int moved;
  ArrayList<Fireball> fireballs = new ArrayList<Fireball>();
  int y;
  Dragon() {
    this.y = 0;
    this.moved = 0;
  }
  void display() {
    rect(975, y, 220, 220);
  }
  void move() {
    if (!up) {
      y+=3;
      moved ++;
      if (moved > 530) {
        up = true;
        moved = 0;
      }
    } else {
      y-=3;
      moved ++;
      if (moved > 530) {
        up = false;
        moved = 0;
      }
    }
  }

  void fireball() {
    fireballs.add(new Fireball(y));
  }
  void displayFireballs() {
    for (int i = 0; i<fireballs.size(); i++) {
      fireballs.get(i).display();
    }
  }
}

Different tab (Fireball): 


class Fireball {
  int x;
  int y;
  Fireball(int y) {
    this.x = 975;
    this.y = y;
  }
  void display() {
    rect(x, y, 100, 100);
  }
}
