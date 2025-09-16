//Creates an instance for each class.
Player player; 
GameManager gameManager; 
Record record; 
//Creates an arraylist of class GameObjects instances such as enemy,obstace, and egg.
ArrayList<GameObjects> gameObjects = new ArrayList<>(); 
void setup() {
  size(800, 600); //Size of canvas
  
  initialiseObjects(); // Calling this method to initilise GameObjects
  //Initilising the instance of  each class  
  
  player = new Player(); 
  gameManager= new GameManager();
  record= new Record(); 
  frameRate(20); //Set frameRate to 15
}
void draw() {
  if (gameManager.isGameOver) {  //Checks if the game is over
    gameManager.gameOverScreen();
    return; //return, in case that user wants to restart the game
  }
  if (gameManager.isGameStarted) { // Checks if the game is Started(any buttton pressed)
    gameManager.drawBackground(player.direction); //draws background
    for (GameObjects obj : gameObjects) { // Iterates through GameObjects arraylist
      obj.display();  //display objects
      obj.update(player.direction); // update method changes the position of the objects 
      if (obj instanceof Movable) {  // Checks if any objects implement class Movable
        Movable movableObjects = (Movable) obj; //Casts the object into a variable type Movable 
        movableObjects.move(); // so do move method
      }
    }
    player.display(); // Method for displaying player
    player.checkCollision(gameObjects); // Boolean function to check if any collison happended
    player.updateCooldown(); //Update cooling down period so, the player can not loose immidately
    record.gameLevel(); // Method to change game level 
    record.bestScore(); //Method to save best score in the text file
    record.displayLives(); //Method to display player's lives
    if (record.liveCount==0) { //check if the player run out of lives to stop the game
      gameManager.isGameOver=true;
    }
  } else {
    gameManager.splashScreen(); // method to display splashscreen(an image to show before starting the game)
  }
}
void keyPressed() { //Keypressed event
  if (gameManager.isGameOver==true) { // When the game is over
    if (keyCode == LEFT) { //Left arrow key turns off the right option,turns On the left option
      gameManager.leftOn = true;
      gameManager.rightOn = false;
    }
    if (keyCode == RIGHT) {//Right arrow key turns off the left option,turns On the right option
      gameManager.leftOn = false;
      gameManager.rightOn = true;
    }
    if (keyCode == ENTER && gameManager.rightOn == true) { //Reset the game
      reset();
      gameManager.isGameOver = false;
    }
    if (keyCode == ENTER && gameManager.leftOn == true) { //Exit the game
      exit();
    }
  }
  if (keyPressed==true) { //If any key is pressed, the game starts
    gameManager.isGameStarted=true;
  }
  // Set the direction based on the pressed key
  if (keyCode == UP  ) {
    player.direction = 1; // Scroll down
  } else if (keyCode == LEFT ) {
    player.direction = 2; // Scroll rigth
  } else if (keyCode == RIGHT ) {
    player.direction = 3; // Scroll left
  } else if (keyCode == DOWN ) {
    player.direction = 4; // Scroll up
  }
}
void keyReleased() {
  // Reset direction to idle when no key is pressed
  player.direction = 0;
}
void reset() { //Reset method clears all object and reset some variables
  gameObjects.clear();
  initialiseObjects();
  gameManager.bgX=0;
  gameManager.bgY=0;
  record.gameLevel=1;
  record.currentScore=0;
  record.liveCount=5;
  gameManager.isGameOver = false;
}
void initialiseObjects() { // This method is for initialising objects
  for (int i=0; i<50; i++) {
    gameObjects.add(new Eggs(random(0, 800), random(0, 600)));
  }
  for (int i=0; i<30; i++) {
    gameObjects.add(new Obstacles(random(0, 800), random(0, 600)));
  }
  for (int i=0; i<10; i++) {
    gameObjects.add(new Enemy(random(0, 800), random(0, 600), int(random(1, 4))));
  }
}
