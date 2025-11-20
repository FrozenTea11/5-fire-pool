// -------------------------------------------
// GLOBALS
// -------------------------------------------
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnCredits, btnSettings, btnQuit, btnStats;

// -------------------------------------------
void setup() {
  size(600, 400);

  // Example buttons for practice starter
  btnStart    = new Button("Start", 10, 200, 160, 50);
  btnCredits    = new Button("Credits:", 110, 300, 160, 50);
  btnSettings    = new Button("Settings", 430, 200, 160, 50);
  btnQuit    = new Button("Quit", 320, 300, 160, 50);
  btnStats  = new Button("stats", 220, 200, 160, 50);
}
// -------------------------------------------
void draw() {
  background(230);
  switch(screen) {
  case 's':
    drawStart();
    break;
  case 'c':
    drawCredits();
    break;
  case 'S':
    drawSettings();
    break;
  case 'Q':
    drawQuit();
    break;
  case 'a':
    drawStats();
    break;
  }

  //btnStart.display();
  //btnMenu.display();
  //btnSettings.display();
  //btnQuit.display();
}

// -------------------------------------------
// MOUSE CLICK HANDLER
// -------------------------------------------
void mousePressed() {
  switch(screen) {
  case 's':
    if (btnStart.clicked()) {
      screen = 'p';
    } else if (btnCredits.clicked()) {
      screen = 'c';
    } else if (btnSettings.clicked()) {
      screen = 'S';
    } else if (btnQuit.clicked()) {
      screen = 'Q';
    } else if (btnStats.clicked()) {
      screen = 'a';
    }
    break;
  }
}
  // -------------------------------------------
  // SCREEN DRAW METHODS (Starter Example)
  // -------------------------------------------
  void drawStart() {
    background(100, 160, 200);
    textAlign(CENTER);
    textSize(32);
    text("START SCREEN", width/2, 50);
    btnStart.display();
    btnCredits.display();
    btnSettings.display();
    btnQuit.display();
    btnStats.display();
  }

  void drawCredits() {
    background(120, 200, 140);
    textSize(32);
    text("CREDITS:", width/2, 50);
  }
// William Watabe
  void drawSettings() {
    background(200, 150, 120);
    textSize(32);
    text("SETTINGS", width/2, 50);
  }
  void drawQuit() {
    exit();
  }

  // -------------------------------------------
  // EMPTY SCREEN METHODS FOR STUDENT PROJECT
  // -------------------------------------------

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

  void drawStats() {
    background(255);
    text("STATS SCREEN (fill this in)", 200, 200);
  }
