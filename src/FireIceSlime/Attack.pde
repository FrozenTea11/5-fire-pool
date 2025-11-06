class Attack {
// Member Variables
int x,y,w,h,speed;
PImage p1;
boolean active;


// Constructor
Attack(int x, int y, int w, int h, int speed, PImage l1) {
this.x = x
this.y = y
this.w = w 
this.h = h
active = false
p1 = loadImage("projectile.png");
}



// Member Methods
void display() {
if (active == true){
image(l1,x,y);
}

}
void move() {

}
}
