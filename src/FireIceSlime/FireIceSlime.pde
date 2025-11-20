Slime slime;
ArrayList<Projectile> projectiles;
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnSettings, btnQuit, btnAudio,btnLvl1,btnLvl2,btnLvl3,btnLvl4,btnLvl5,btnLvl6;

void setup() {
  size(1200, 750);
  smooth();
  slime = new Slime(width/2, height/2);
  btnStart    = new Button("Start", 10, 200, 160, 50);
  btnMenu    = new Button("Go to Menu", 70, 300, 160, 50);
  btnSettings    = new Button("Settings", 430, 200, 160, 50);
  btnQuit    = new Button("Quit", 320, 300, 160, 50);
  btnAudio  = new Button("Audio", 220, 200, 160, 50);
  btnLvl1    = new Button("Level 1", 360, 300, 160, 50);
  btnLvl2    = new Button("Level 2", 600, 300, 160, 50);
  btnLvl3    = new Button("Level 3", 360, 400, 160, 50);
  btnLvl4    = new Button("Level 4", 600, 400, 160, 50);
  btnLvl5    = new Button("Level 5", 360, 500, 160, 50);
  btnLvl6    = new Button("Level 6", 600, 500, 160, 50);
projectiles = new ArrayList<Projectile>();
}

void draw() {
  background(30, 30, 40);
  slime.update();
  // Shadow on ground
  noStroke();
  fill(0, 50);
  ellipse(slime.x, slime.groundY + slime.radius * 0.8, slime.radius * 1.6, slime.radius * 0.5);
  slime.display();
switch(screen) {
  case 's':
    drawStart();
    break;
  case 'm':
    drawMenu();
    break;
  case 'S':
    drawSettings();
    break;
  case 'a':
    drawAudio();
    break;
  }
 // Randomly spawn new projectiles
  if (frameCount % 40 == 0) { // adjust frequency
    projectiles.add(new Projectile());
  }

  // Update and display all projectiles
  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.move();
    p.display();

    // Remove projectiles if they go off screen
    if (p.x < -50 || p.x > width + 50 || p.y < -50 || p.y > height + 50) {
      projectiles.remove(i);
    }
  }
}
}

void mousePressed() {
  switch(screen) {
  case 's':
    if (btnStart.clicked()) {
      screen = 'p';
    } else if (btnMenu.clicked()) {
      screen = 'm';
    } else if (btnSettings.clicked()) {
      screen = 'S';
    } else if (btnQuit.clicked()) {
      screen = 'Q';
    } else if (btnAudio.clicked()) {
      screen = 'a';
    }
    break;
  }
}

void drawStart() {
    background(100, 160, 200);
    textAlign(CENTER);
    textSize(32);
    text("START SCREEN", width/2, 50);
    btnStart.display();
    btnMenu.display();
    btnSettings.display();
    btnQuit.display();
    btnAudio.display();
  }

  void drawCredits() {
    background(120, 200, 140);
    textSize(32);
    text("CREDITS:", width/2, 50);
  }

void drawSettings() {
    background(200, 150, 120);
    textSize(32);
    text("SETTINGS", width/2, 50);
  }

void drawQuit() {
    exit();
  }

void drawPlay() {
    background(255);
    text("PLAY SCREEN (fill this in)", 200, 200);
  }

  void drawPause() {
    background(255);
    text("PAUSE SCREEN (fill this in)", 200, 200);
  }

  void drawGameOver() {
    background(255);
    text("GAME OVER SCREEN (fill this in)", 200, 200);
  }

  void drawAudio() {
    background(255);
    text("AUDIO SCREEN (fill this in)", 200, 200);
  }

void keyPressed() {
  slime.handleKeyPressed();
}

void keyReleased() {
  slime.handleKeyReleased();
}
