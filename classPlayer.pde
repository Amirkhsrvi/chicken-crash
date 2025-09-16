// The Player class represents the player character
class Player {
  // Sprite sheet for the player with frames
  PImage player;
  PImage [] playerFrames;
  // Player's position
  float playerX=width/2;
  float playerY=height/2;
  // Direction of movement: 0 = idle, 1 = up, 2 = left, 3 = right, 4 = down
  int direction=0;
  // Counter for animation frame
  int imageCounter=1;
  // Cooldown variables to handle collision effects
  int coolingCounter=0;
  boolean isCooldown = false;
  private Explosion explosion;
  // Constructor
  Player() {
    // Load the sprite sheet for the player
    player = loadImage("chicken_walk.png");
    // Create an array to store 16 frames for player animation
    playerFrames = new PImage[16];
    // Extract frames from the sprite sheet 
    int index=0;
    for ( int row=0; row<4; row++) {
      for (int col=0; col<4; col++) {
        playerFrames[index++] = player.get(col*32, row*32, 32, 32);
      }
    }
    explosion = new Explosion();
  }
  // Displays the player on the screen based on the direction and display the explosion
  void display() {
    if (direction==1) {
      playerWalking(0);
    } else if (direction==2) {
      playerWalking(4);
    } else if (direction==3) {
      playerWalking(12);
    } else if (direction==4) {
      playerWalking(8);
    } else {
      image(playerFrames[12], playerX, playerY);
    }
    // If in cooldown, display the explosion effect
    if (isCooldown) {
      explosion.display();
    }
  }
  // Handles the walking animation by cycling through the frames
  void playerWalking(int i) {
    if (imageCounter ==1) {
      image(playerFrames[i], playerX, playerY);
    } else if (imageCounter ==2) {
      image(playerFrames[i+1], playerX, playerY);
    } else if (imageCounter ==3) {
      image(playerFrames[i+2], playerX, playerY);
    } else {
      image(playerFrames[i+3], playerX, playerY);
    }
    imageCounter++;
    if (imageCounter>4) {
      imageCounter=1;
    }
  }
  //Boolean method for Checks for collisions with other game objects
  boolean checkCollision(ArrayList<GameObjects> gameObjects) {
    // Iterate through the list of game objects
    for (int i = gameObjects.size() - 1; i >= 0; i--) {
      GameObjects obj = gameObjects.get(i);
      // Check if the distance between the player and the object is less than 28
      if (dist(this.playerX, this.playerY, obj.x, obj.y) < 28 ) {
        obj.onCollision(true); // Trigger collision behavior on the object
        gameObjects.remove(i); // Remove the collided object from the list

        return true; // Collision detected
      }
    }
    return false; // No collision detected
  }
  // Starts the cooldown period after a collision
  void startCooldown() {
    isCooldown = true; // Set the cooldown flag
    coolingCounter = millis(); // Record the current time
  }
  // Updates the cooldown state and resets it after 1 second
  void updateCooldown() {
    if (isCooldown && millis() - coolingCounter > 1000) {
      isCooldown = false; // End the cooldown period
    }
  }
  // Private class representing an Explosion animation
private class Explosion {
  //explosion's position
  float x=width/2, y=height/2;
  // Counter to cycle through the animation frames
  int imageCounter=1;
  // Image and array of frames for the explosion animation
  PImage explosion;
  PImage [] explosionFrames;
  // Constants for the size of each frame and the total number of frames in the spritesheet
  private static final int explosionTileSize = 64;
  private static final int explosionSpriteSize = 24;
  // Constructor: Initializes the explosion animation
  Explosion() {
    // Load the explosion sprite sheet
    explosion = loadImage("explosion.png");

    // Extract individual frames from the sprite sheet
    explosionFrames = new PImage[explosionSpriteSize];
    int index=0;
    for ( int row=0; row<3; row++) {
      for (int col=0; col<8; col++) {
        explosionFrames[index++] = explosion.get(col*explosionTileSize, row*explosionTileSize, explosionTileSize, explosionTileSize);
      }
    }
  }

  // Displays the explosion animation
  void display() {
    if (imageCounter ==1) {
      image(explosionFrames[0], x, y);
    } else if (imageCounter ==2) {
      image(explosionFrames[1], x, y);
    } else if (imageCounter ==3) {
      image(explosionFrames[2], x, y);
    } else if (imageCounter ==3) {
      image(explosionFrames[3], x, y);
    } else if (imageCounter ==3) {
      image(explosionFrames[4], x, y);
    } else if (imageCounter ==3) {
      image(explosionFrames[5], x, y);
    } else {
      image(explosionFrames[6], x, y);
    }
    // Increment the image counter
    imageCounter++;
    if (imageCounter>4) {
      imageCounter=1; // Reset the counter
    }
  }
}
}
