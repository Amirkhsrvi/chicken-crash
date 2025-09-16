class Record {
  String [] savedFile;
  int [] scores;
  int gameLevel=1;
  int currentScore=0;
  int liveCount=5;
  PImage lives;
  private static final int liveImageSize  = 64;
  Record() {
    lives = loadImage("heart.png");
    lives.resize(liveImageSize, liveImageSize);
    savedFile =loadStrings("savedfile.txt");
    scores = new int[savedFile.length];
    for (int i=0; i<savedFile.length; i++) {
      scores[i]=Integer.valueOf(savedFile[i]);
    }
  }
  void bestScore() {
    for (int i=0; i<scores.length; i++) {
      if (scores[i] < currentScore) {
        scores[i]=currentScore;
      }
    }
    for (int i=0; i<scores.length; i++) {
      savedFile[i]=String.valueOf(scores[i]);
    }
    saveStrings("savedfile.txt", savedFile);
  }

  void gameLevel() {
    if (currentScore==5 && gameLevel==1) {
      gameLevel=2;
      for (int i=0; i<2; i++) {
        gameObjects.add(new Enemy(int(random(0, 800)), int(random(0, 600)), int(random(1, 4)),20));
      }
    } else if (currentScore==10 && gameLevel==2) {
      gameLevel=3;
      for (int i=0; i<2; i++) {
        gameObjects.add(new Enemy(int(random(0, 800)), int(random(0, 600)), int(random(1, 4)),30));
      }
    }
  }
  void displayLives() {
    for (int i=0; i<liveCount; i++) {

      image(lives, i*liveImageSize/2, 20);
    }
    fill(1);
    textSize(25);
    textAlign(RIGHT);
    text("Level:"+gameLevel+" Eggs:"+currentScore+" Record:"+scores[0], width, lives.height);
    textAlign(CENTER);
  }
}
