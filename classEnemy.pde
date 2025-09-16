// Enemy class represents a game enemy, extends GameObjects, and implements Movable interface
class Enemy extends GameObjects implements Movable {
  float xSpeed=4, ySpeed=4; // Speed variables for enemy movement
  int imageCounter=1; // Counter for cycling through enemy sprite animations
  // Images and frames for enemy sprite animations
  PImage enemyImage;
  PImage [] enemyFrames;
  int enemyDirection=1; // Direction the enemy is moving (1: up, 2: left, 3: right, 4: down)
  // Variables for tracking movement and patrol behavior
  float dY=0;
  float dX=0;
  // Distance to travel before changing direction
  float distToChangeDir=40;
  // Constants for sprite and tile sizes
  private static final int enemyTileSize = 32;
  private static final int enemySpriteSize = 12;

  // Constructor: Initializes enemy at a given position and direction
  Enemy(float x, float y, int enemyDirection) {
    super(x, y); // Call the parent class constructor
    this.enemyDirection= enemyDirection;

    // Load the enemy sprite sheet and extract frames
    enemyImage = loadImage("cat.png");
    enemyFrames = new PImage[enemySpriteSize];
    int index=0;
    for ( int row=0; row<4; row++) {
      for (int col=0; col<3; col++) {
        enemyFrames[index++] = enemyImage.get(col*enemyTileSize, row*enemyTileSize, enemyTileSize, enemyTileSize);
      }
    }
  }
  // Overloaded constructor: Allows to spawn enemies with different speed
  Enemy(float x, float y, int enemyDirection, float xSpeed) {
    super(x, y); // Call the parent class constructor
    this.enemyDirection= enemyDirection;
    this.xSpeed=xSpeed;

    // Load the enemy sprite sheet and extract frames
    enemyImage = loadImage("cat.png");
    enemyFrames = new PImage[enemySpriteSize];
    int index=0;
    for ( int row=0; row<4; row++) {
      for (int col=0; col<3; col++) {
        enemyFrames[index++] = enemyImage.get(col*enemyTileSize, row*enemyTileSize, enemyTileSize, enemyTileSize);
      }
    }
  }

  // Handles enemy movement based on its current direction
  void move() {
    switch (enemyDirection) {
    case 0: // Idle, no movement
      break;
    case 1:
      y=y-ySpeed; // Move up
      dY--;
      break;
    case 2: // Move left
      x=x-xSpeed;
      dX--;
      break;
    case 3: // Move right
      x=x+xSpeed;
      dX++;
      break;
    case 4: // Move down
      y=y+ySpeed;
      dY++;
      break;
    }
    // Adjust patrol behavior
    enemyPatrol();
  }
  // Animates the enemy using its frames
  void enemyAnimation(int i) {
    if (imageCounter ==1) {
      image(enemyFrames[i], x, y);
    } else if (imageCounter ==2) {
      image(enemyFrames[i+1], x, y);
    } else {
      image(enemyFrames[i+2], x, y);
    }

    // Cycle through the frames
    imageCounter++;
    if (imageCounter>3) {
      imageCounter=1;
    }
  }
  // Patrol logic for changing the enemy's direction
  void enemyPatrol() {

    if (dY<=-distToChangeDir) {
      dY=0;
      enemyDirection=(int) random(1, 5);
    }
    if (dX>=distToChangeDir) {
      dX=0;
      enemyDirection=(int) random(1, 5);
    }
    if (dY>=distToChangeDir) {
      dY=0;
      enemyDirection=(int) random(1, 5);
    }
    if (dX<=-distToChangeDir) {
      dX=0;
      enemyDirection=(int) random(1, 5);
    }
  }

  // Displays the enemy with appropriate animation based on its direction
  @Override
    void display() {

    if (enemyDirection==0) {
      image(enemyFrames[4], x, y);
    } else if (enemyDirection==1) {
      enemyAnimation(9);
    } else if (enemyDirection==2) {
      enemyAnimation(3);
    } else if (enemyDirection==3) {
      enemyAnimation(6);
    } else {
      enemyAnimation(0);
    }
  }
  // Handles collision behavior for the enemy
  @Override
    void onCollision(boolean onCollision) {
    record.liveCount--;  // Decrease player's life count
    player.startCooldown();  // Trigger player's cooldown behavior
  }
}
