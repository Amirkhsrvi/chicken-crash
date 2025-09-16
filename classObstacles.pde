//Represents obstacles in the game, inheriting from GameObjects
class Obstacles extends GameObjects {
  // Images for the obstacle in two different angle
  PImage obstacleImage,obstacleImage2;
  // Constant size for the obstacle images
  private static final int obstacleImageSize = 32;
  // Constructor: Initializes the obstacle's position and loads its images
  Obstacles(float x, float y) {
    super(x, y); // Call the parent class constructor
    // Load and resize the images
    obstacleImage = loadImage("obstacle.png");
    obstacleImage.resize(obstacleImageSize, obstacleImageSize);
    obstacleImage2 = loadImage("obstacleR.png");
    obstacleImage2.resize(obstacleImageSize, obstacleImageSize);
  }
   // Override the display method to show the obstacles based on player direction
  @Override
   void display() {
     if(player.direction==2){
    image(obstacleImage, x, y);
     }if(player.direction==3){
     image(obstacleImage2, x, y);
     }else{
     image(obstacleImage, x, y);
     }
  }
   // Override onCollision method to define behavior when the obstacle collides the player
  @Override
    void onCollision(boolean onCollision) {
        record.liveCount--;  // Reduce lives
        player.startCooldown();  // Cooldown behavior
    }
}
