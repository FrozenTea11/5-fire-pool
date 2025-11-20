Slime slime;
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnCredits, btnSettings, btnQuit, btnAudio;

void setup() {
  size(1200, 750);
  smooth();
  slime = new Slime(width/2, height/2);
  btnStart    = new Button("Start", 10, 200, 160, 50);
  btnCredits    = new Button("Credits:", 110, 300, 160, 50);
  btnSettings    = new Button("Settings", 430, 200, 160, 50);
  btnQuit    = new Button("Quit", 320, 300, 160, 50);
  btnAudio  = new Button("Audio", 220, 200, 160, 50);
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
    drawAudio();
    break;
  }
}

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
    btnCredits.display();
    btnSettings.display();
    btnQuit.display();
    btnAudio.display();
  }

void keyPressed() {
  slime.handleKeyPressed();
}

void keyReleased() {
  slime.handleKeyReleased();
}
