//Liam Stoll, Max Elkin, Will Watabe, Lucas Wu, Gabby Neff
Slime slime;
ArrayList<Projectile> projectiles;
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnMenu, btnSettings, btnQuit, btnAudio, btnLvl1, btnLvl2, btnLvl3, btnLvl4, btnLvl5, btnLvl6;
Level level;

void setup() {
  size(1200, 750);
  smooth();
  level = new Level([Name of background]);
  level.addPlatform(0, height-50, width, 50, [Name of image]);
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
  case 'p':
    drawPlay();
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
  fill(0);
  text("START SCREEN", width/2, 50);
  btnStart.display();
  btnMenu.display();
  btnSettings.display();
  btnQuit.display();
  btnAudio.display();
}

void drawMenu() {
  background(120, 200, 140);
  textSize(32);
  fill(0);
  text("Choose Level", width/2, 50);
  btnLvl1.display();
  btnLvl2.display();
  btnLvl3.display();
  btnLvl4.display();
  btnLvl5.display();
  btnLvl6.display();
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
  level.sketch();
  slime.display();
  for (int i=0; i<level.platforms.size(); i++) {
    slime.findFloor(level.platforms.get(i));
  }
  for (int i=0; i<projectiles.size(); i++){
    if(slime.projectileCollision(projectiles.get(i))){
      rect(20, 20, 200, 100);
    }
  }
  slime.update();
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
