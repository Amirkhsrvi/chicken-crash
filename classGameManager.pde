// GameManager class handles the game's state, screens, and background management
class GameManager {
  // Background speed and position variables
  float bgXspeed=5, bgYspeed=5;
  float bgX=0, bgY=0;

  // Background and splash screen images
  PImage backgroundImage, splashImage;

  // Game states
  boolean isGameOver = false;
  boolean isGameStarted = false;
  // Flags for navigation options on game over screen
  boolean leftOn = false;
  boolean rightOn = false;
  // Font for the splash screen
  PFont splashFont;

  // Constructor: Initializes resources such as fonts and images
  GameManager() {
    // Load and set the splash screen font
    splashFont = createFont("SuperMario256.ttf", 128);
    // Load and resize background and splash screen images
    backgroundImage = loadImage("background.png");
    backgroundImage.resize(width, height);
    splashImage = loadImage("splashScreen.png");
    splashImage.resize(width, height);
  }
  // Displays the "Game Over" screen with options to restart
  void gameOverScreen() {
    background(0);// Set a black background
    // Draw the left "No" circle, highlight if selected
    if (leftOn) {
      fill(255);  // White for selected
    } else {
      fill(0);  // Black for unselected
    }
    ellipse(width/2-100, height/2+200, 10, 10);  // Draw left circle
    // Draw the right "Yes" circle, highlight if selected
    if (rightOn) {
      fill(255);  // White for selected
    } else {
      fill(0);  // Black for unselected
    }
    ellipse(width/2, height/2+200, 10, 10);  // Draw right circle
    // Display game over text and options
    fill(255);// White text
    text("Game Over", width/2, height/2);
    text("Restart ?", width/2, height/2+100);
    text("YES", width/2+50, height/2+200);
    text("NO", width/2-50, height/2+200);
  }

  // Draws the game background with movement based on the given direction
  void drawBackground(int direction) {
    // Loop through a grid of 3*3 to draw the background
    for (int col=-1; col<2; col++) {
      for (int row=-1; row<2; row++) {
        image(backgroundImage, bgX+(width*col), bgY+(height*row));
      }
    }
    // Move background based on the specified direction
    if (direction==1) { // Move down
      bgY+=bgYspeed;
    } else if (direction==2) { // Move right
      bgX+=bgXspeed;
    } else if (direction==3) { // Move left
      bgX-=bgXspeed;
    } else if (direction==4) { // Move up
      bgY-=bgYspeed;
    }
    // Reset background position if it moves out of bounds
    if (bgX>width || bgX<-width) {
      bgX=0;
    }
    if (bgY>height || bgY<-height) {
      bgY=0;
    }
  }

  // Displays the splash screen at the start of the game
  void splashScreen() {
    // Draw the splash screen image
    image(gameManager.splashImage, gameManager.bgX, gameManager.bgY);
    // Display the game title
    fill(212, 1, 27);  // Red color
    textAlign(CENTER);
    textFont(gameManager.splashFont, 60);
    text("Chicken Crash !", width/2, height/2);
    fill(255); // White text
  }
}
