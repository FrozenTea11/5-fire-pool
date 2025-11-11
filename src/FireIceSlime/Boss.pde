
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

