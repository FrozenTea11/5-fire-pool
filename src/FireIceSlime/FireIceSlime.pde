//Liam Stoll, Max Elkin, Will Watabe, Lucas Wu, Gabby Neff
Slime slime;
ArrayList<Projectile> projectiles;
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnMenu, btnSettings, btnQuit, btnAudio, btnLvl1, btnLvl2, btnLvl3, btnLvl4, btnLvl5, btnLvl6;
// Button btnBrightUp, btnBrightDown; //William Watabe
Level level;

// float brightnessValue = 255; // William Watabe

void setup() {
  size(1200, 750);
  smooth();
  level = new Level("placeholder.png");
  level.addPlatform(0, height-50, width, 50, "placeholder.png.png");
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
  // btnBrightUp   = new Button("+ Bright", width/2 -20, 350, 160, 50); // William Watabe
  // btnBrightDown = new Button("- Bright", width/2-200+ 20, 350, 160, 50); // William Watabe
    
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
  case 'g':
    drawGameOver();
    break;
  }
  // Randomly spawn new projectiles
  if (frameCount % 40 == 0) { // adjust frequency
    projectiles.add(new Projectile()); // William Watabe
  }

  // Update and display all projectiles // William Watabe
  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.move();
    p.display();

    // Remove projectiles if they go off screen
    if (p.x < -50 || p.x > width + 50 || p.y < -50 || p.y > height + 50) {
      projectiles.remove(i);
    }
  }
   // noStroke(); // William Watabe
    // fill(0, 0, 0, 255 - brightnessValue);
    // rect(0, 0, width, height);
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
      exit();
    } else if (btnAudio.clicked()) {
      screen = 'a';
    }
    break;
      // case 'S': // William Watabe
        // if (btnBrightUp.clicked()) {
          // brightnessValue += 25;
          // brightnessValue = constrain(brightnessValue, 0, 255);
        // }
        // if (btnBrightDown.clicked()) {
          // brightnessValue -= 25;
          // brightnessValue = constrain(brightnessValue, 0, 255);
        // }
        // break;
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

 void drawSettings() { // William Watabe
    background(200, 150, 120);
    textAlign(CENTER);
    textSize(32);
    text("SETTINGS", width/2, 100);
  
    // fill(0);
    // textSize(22);
    // text("Brightness: " + int(brightnessValue), width/2, 250);
  
    // btnBrightUp.display();
    // btnBrightDown.display();
  }

void drawGameOver() {
  exit(); //Replace with game over code
}

void drawPlay() {
  level.sketch();
  slime.display();
  for (int i=0; i<level.platforms.size(); i++) {
    slime.findFloor(level.platforms.get(i));
  }
  for (int i=0; i<projectiles.size(); i++){
    if(slime.projectileCollision(projectiles.get(i))){
      screen = 'g';
    }
  }
  slime.update();
  fill(125);
  rect(50,50,100,100,20);
  fill(255);
  textSize(50);
  text(millis()/1000,100,100);
}

void drawPause() {
  background(255);
  text("PAUSE SCREEN (fill this in)", 200, 200);
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
