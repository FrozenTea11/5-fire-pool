
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
