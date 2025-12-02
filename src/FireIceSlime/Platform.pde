//Liam Stoll
class Platform{
  int x, y, w, h;
  PImage img;
  
  Platform(int x, int y, int w, int h, String img){
    this.img = loadImage(img);
    this.img.resize(w, h);
    
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display(){
    image(img, x, y);
  }
}
