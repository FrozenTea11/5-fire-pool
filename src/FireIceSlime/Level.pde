class Level {
  PImage img;
  ArrayList<Platform> platforms;

  Level(String img) {
    this.platforms = new ArrayList<Platform>();
    this.img = loadImage(img);
    this.img.resize(width, height);
  }

  void addPlatform(int x, int y, int w, int h, String i){
    platforms.add(new Platform(x, y, w, h, i));
  }
  
  void sketch() {
    background(img);
    for (int i=0; i<platforms.size(); i++){
      platforms.get(i).display();
    }
  }
}
