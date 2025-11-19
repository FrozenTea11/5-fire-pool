Slime slime;

void setup() {
  size(800, 600);
  smooth();
  slime = new Slime(width/2, height/2);
}

void draw() {
  background(30, 30, 40);
  slime.update();
  // Shadow on ground
  noStroke();
  fill(0, 50);
  ellipse(slime.x, slime.groundY + slime.radius * 0.8, slime.radius * 1.6, slime.radius * 0.5);
  slime.display();
}

void keyPressed() {
  slime.handleKeyPressed();
}

void keyReleased() {
  slime.handleKeyReleased();
}

// ---------------- SLIME CLASS ----------------
class Slime {
  float x, y;
  float vx, vy;
  float radius = 60;
  boolean left, right;
  boolean onGround = true;
  float gravity = 0.35;
  float jumpPower = -9;
  float groundY;
  // Blinking
  boolean isBlinking = false;
  int blinkTimer = 0;
  int nextBlinkFrame = 0;
  int blinkDuration = 6;
  
  // Colors for the gradient
  color redColor = color(255, 0, 0);
  color blueColor = color(0, 0, 255);

  Slime(float startX, float startY) {
    x = startX;
    groundY = startY;
    y = groundY;
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
  }

  void handleKeyReleased() {
    if (key == CODED) {
      if (keyCode == LEFT) left = false;
      if (keyCode == RIGHT) right = false;
    }
  }

  void update() {
    float speed = 3;
    vx = 0;
    if (left) vx -= speed;
    if (right) vx += speed;
    x += vx;

    if (!onGround) {
      vy += gravity;
      y += vy;
      if (y >= groundY) {
        y = groundY;
        vy = 0;
        onGround = true;
      }
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
}
