# 2D Java Processing Game

A simple 2D game built in **Java with Processing**. The player controls a character that avoids obstacles, collects eggs, and survives against enemies. The game tracks score, lives, and levels, with a splash screen and game-over menu.

---

## Features
- **Player movement**: controlled with arrow keys (up, down, left, right).  
- **Game objects**: dynamically created enemies, eggs, and obstacles.  
- **Collision detection**: player loses lives on collision.  
- **Game states**: splash screen, active play, and game-over screen.  
- **Scoring system**: keeps track of score and best score (stored in a file).  
- **Difficulty scaling**: level increases as you progress.  
- **Reset & exit options** after game over.

---

## Tech Stack
- **Language**: Java  
- **Library**: Processing (for graphics and input handling)  
- **OOP Design**: Classes for `Player`, `Enemy`, `Obstacles`, `Eggs`, `GameManager`, `Record`  

---

## How to Run
1. Install [Processing](https://processing.org/download/).  
2. Clone or download this repository.  
3. Open the `.pde` or `.java` files in the Processing IDE.  
4. Press the **Run** button ▶️.  

---

## Controls
- **Arrow Keys**: move player (Up, Down, Left, Right).  
- **Enter**: restart or exit (on game-over screen).  

---

## Learning Outcomes
- Designed and implemented an **event-driven game loop**.  
- Applied **object-oriented programming** principles (inheritance, interfaces, polymorphism).  
- Used **ArrayLists** to dynamically manage game objects.  
- Implemented **collision detection** and user input handling.  
- Learned how to manage **game states** and persist scores in a file.

---

## Future Improvements
- Add sound effects and background music.  
- More enemy types and power-ups.  
- Save/load multiple high scores.  
- Improved graphics and animations.

