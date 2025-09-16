class Eggs extends GameObjects { 
  PImage eggImage; //Image of the egg
  int eggSize = 32; //Size of the egg image
  // Constructor for the Eggs class
  Eggs(float x, float y) { 
    super(x, y); // Call the parent constructor with x and y
    eggImage = loadImage("egg.png"); //Load the egg image
    eggImage.resize(eggSize, eggSize);  //Resize the egg image
  }
  // Override the display method to draw the egg on the screen
  @Override
    void display() {
    image(eggImage, x, y); //Draw the egg image at x and y
  }
  // Override the onCollision method to handle collisions with the egg
  @Override
    void onCollision(boolean onCollision) {
    record.currentScore++;  // Increase the player's score when the egg is collected
  }
}
