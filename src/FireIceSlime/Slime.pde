!ALERT! This code is not completely functional, its just a placeholder: 

float x = 100;   // player x position
float y = 700;   // player y position
float gravX = 0;  // horizontal gravocity
float gravY = 0;  // vertical gravocity
boolean standingOnGround = true;



void setup() {
  size(1200, 750);
}

void draw() {
  background(200);
  rect(300, 500, 100, 100);
  fill(255);
  // Gravity
  if (!standingOnGround) {
    gravY += 0.2; // gravity strength
  }

  // Update position
  x += gravX;
  y += gravY;

  // Ground collision
  if (y >= 700) {
    gravY = 0;
    standingOnGround = true;
  } else if (x >= 100 && x<=200 && y >=300 && y<=200){
    gravY = 0;
    standingOnGround = true;
  }

  // Draw player
  fill(255, 0, 0);
  rect(x, y, 40, 40);
}

void keyPressed() {
  if (keyCode == LEFT) {
    gravX = -5;
  }
  if (keyCode == RIGHT) {
    gravX = 5;
  }
  if (keyCode == UP && standingOnGround) {
    gravY = -12; // jump force
    standingOnGround = false;
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    gravX = 0;
  }
}



