//Gabby Neff: base code, Max Elkin: WAD, Liam Stoll: Fine tuning & functionality
class Slime {
  float x, y;
  float speed = 7;
  float vx, vy;
  float radius = 40;
  boolean left, right;
  boolean onGround = false;
  float gravity = 0.35;
  float jumpPower = -12;
  float groundY;
  // Blinking
  boolean isBlinking = false;
  int blinkTimer = 0;
  int nextBlinkFrame = 0;
  int blinkDuration = 6;
  boolean canMove = true;

  // Colors for the gradient
  color redColor = color(255, 0, 0);
  color blueColor = color(0, 0, 255);

  Slime(float startX, float startY) {
    this.x = startX;
    this.groundY = startY;
    this.y = groundY;
    scheduleNextBlink();
  }

  void handleKeyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) left = true;
      if (keyCode == RIGHT) right = true;
      if (keyCode == UP && onGround) {
        vy = jumpPower;
        onGround = false;
      }
    }
    if (key == 'a') left = true;
    if (key == 'd') right = true;
    if (key == 'w' && onGround) {
      vy = jumpPower;
      onGround = false;
    }
  }

  void handleKeyReleased() {
    if (key == CODED) {
      if (keyCode == LEFT) left = false;
      if (keyCode == RIGHT) right = false;
    }
    
    if (key == 'a') left = false;
    if (key == 'd') right = false;
  }

  void update() {
    vx = 0;
    if (left && canMove) vx -= speed;
    if (right && canMove) vx += speed;
    x += vx;
    vy += gravity;
    y += vy;
    if (y >= groundY-radius) {
      y = groundY-radius;
      vy = 0;
      onGround = true;
      canMove = true;
    }


    if (x < radius) x = radius;
    if (x > width - radius) x = width - radius;

    updateBlinking();
  }

  // ------------- Blinking -------------
  void scheduleNextBlink() {
    nextBlinkFrame = frameCount + int(random(120, 300));
  }

  void updateBlinking() {
    if (!isBlinking && frameCount >= nextBlinkFrame) {
      isBlinking = true;
      blinkTimer = blinkDuration;
    }
    if (isBlinking) {
      blinkTimer--;
      if (blinkTimer <= 0) {
        isBlinking = false;
        scheduleNextBlink();
      }
    }
  }

  // ------------- Drawing -------------
  void display() {
    //Shadow
    fill(0,0,0,120);
    ellipse(x, groundY, radius * 1.6, radius * 0.5);
    float bounceOffset = 0;
    if (!onGround || vx != 0) {
      float bounceAmp = 5 * 0.25;
      float bounceSpeed = 0.15;
      bounceOffset = sin(frameCount * bounceSpeed) * bounceAmp;
    }

    pushMatrix();
    translate(x, y + bounceOffset);

    float squish = (float)sin(frameCount * 0.2) * 0.025;
    float bodyW = radius * 2 * (1 + squish);
    float bodyH = radius * 2 * (1 - squish);

    noStroke();

    for (int i = 0; i < bodyW; i++) {
      float lerpAmt = map(i, 0, bodyW, 0, 1);
      color gradientColor = lerpColor(redColor, blueColor, lerpAmt);
      stroke(gradientColor);
      float halfLineH = bodyH / 2 * sqrt(1 - pow(map(i, 0, bodyW, -1, 1), 2));
      line(-bodyW/2 + i, -halfLineH, -bodyW/2 + i, halfLineH);
    }

    noStroke();

    drawFace();
    popMatrix();
  }

  void drawFace() {
    float eyeOffsetX = radius * 0.4;
    float eyeOffsetY = -radius * 0.15;
    float eyeW = radius * 0.35;
    float eyeH = radius * 0.40;

    fill(255);
    stroke(0);
    strokeWeight(3);

    if (isBlinking) {
      float y = eyeOffsetY;
      line(-eyeOffsetX - eyeW*0.3, y, -eyeOffsetX + eyeW*0.3, y);
      line( eyeOffsetX - eyeW*0.3, y, eyeOffsetX + eyeW*0.3, y);
    } else {
      ellipse(-eyeOffsetX, eyeOffsetY, eyeW, eyeH);
      ellipse( eyeOffsetX, eyeOffsetY, eyeW, eyeH);
    }
  }
  // Collision detection
  void findFloor(Platform p) {
    if (x+radius > p.x && x < p.x+p.w) {
      if (y <= p.y) {
        groundY = p.y+p.h/2;
      } else if (y <= p.y+radius*2) {
        vy=jumpPower/2;
        canMove = false;
      }
    }
  }
  boolean projectileCollision(Projectile p){
    return x+radius>=p.x && x-radius<=p.x+p.w && y+radius>=p.y && y-radius<=p.y+p.h;
  }
}
