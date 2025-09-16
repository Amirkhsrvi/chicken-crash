// Abstract class GameObjects is a base structure for the game objects
abstract class GameObjects { 
  // Position and speed variables for the game object
  float x, y, xSpeed=5, ySpeed=5;
  // Constructor: Initializes the position of the object
  GameObjects(float x, float y) {
    this.x=x;
    this.y=y;
  }
  // Abstract method to display the object (implementation in sub classes)
  abstract void display();
   // Abstract method to handle collisions (implementation in sub classes)
  abstract void onCollision(boolean onCollision) ;
  
  // Updates the position of theobjects based on the direction
  void update(int direction) {// Direction values: 1 = down, 2 = right, 3 = left, 4 = up
    if (direction==1) {// Move down
      y+=ySpeed;
    } else if (direction==2) { // Move right
      x+=xSpeed;
    } else if (direction==3) { // Move left
      x-=xSpeed;
    } else if (direction==4) {// Move up
      y-=ySpeed;
    }
    // Reset the object's position back the screen if it goes out of it
    if (x>width) {
      x=0;
    } else if (x<0) {
      x=width;
    }
    if (y>height) {
      y=0;
    } else if (y<0) {
      y=height;
    }
  }
}
