Game game;
ArrayList<String> word = new ArrayList<String>();
boolean gameInProgress = false;
int startMessageTime = 0;
boolean displayStartMessage = true;
import processing.sound.*;

SoundFile introSound;


ArrayList<Button> buttons = new ArrayList<Button>();
Slider slider;
boolean mainMenu = true;
String selectedMode = "";
String difficulty = "";
boolean soundOn = true;
int highScore;

//Earth earth;
//HP hp; // Initialize the HP class


void setup() {
  size(500, 500);
  frameRate(60);
  
  introSound = new SoundFile(this, "spaceintro.mp3"); 
  introSound.loop();
  
  
  // Main Menu Buttons
  buttons.add(new Button(200, 100, 100, 40, "Play"));
  buttons.add(new Button(200, 160, 100, 40, "Sound"));
  buttons.add(new Button(200, 220, 100, 40, "Quit"));
  buttons.add(new Button(60, 300, 80, 40, "Easy"));
  buttons.add(new Button(160, 300, 80, 40, "Medium"));
  buttons.add(new Button(260, 300, 80, 40, "Hard"));
  buttons.add(new Button(360, 300, 80, 40, "Endless"));
  
  // Main Menu slider
  slider = new Slider(255, 430, 300, 30, 50, 50, 0.5, 1.5);
  
  game = new Game(slider.fallRate, 0.01);
  game.generateGame();
  gameInProgress = true;
  
  //earth = new Earth();
  //earth.initializeSpinningEarth(); // Set up the earth
  //hp = new HP(10, 10, 3); // Set up the HP class
}


void draw() {
  if (mainMenu) {
    // Display the main menu
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("Main Menu", width / 2, 50);
    textSize(16);
    text("High Score: "+highScore,50,400);

    // Display buttons
    for (Button b : buttons) {
      b.checkHover(mouseX, mouseY);
      b.display();
    }
    // Display slider
    if (mousePressed) {
      slider.isSelected(mouseX, mouseY); // Check if slider is selected and update slider
    }
    slider.display();
    
  } else if (gameInProgress) {
    // Falling Asteroids game
    background(0);
    fill(255);
    textSize(24);
    if (displayStartMessage) {
      int elapsedTime = millis() - startMessageTime;
      if (elapsedTime <= 3000) { //3 seconds
          textSize(24);
          fill(255);
          textAlign(CENTER, CENTER);
          text("Game Started: " + selectedMode + " (" + difficulty + ")", width / 2, height / 2);
      } else {
        displayStartMessage = false; 
      }
     }
    
    // Update and display the game
    game.updateGame();
    if (!game.isFinished()) {
      String temp = "";
      String fullWord = temp.join("", word);
      textSize(50);
      text(fullWord, 250, 400);
      if (game.checkText(fullWord)) {
        word.clear();
      }
      highScore=game.score;
    } else {
      gameInProgress = false;
      if(game.score>highScore){
        highScore=game.score;
      }
      // Need to display some HUD asking the user to play again.
    }
  }
}




void keyPressed(){
  if(gameInProgress){
    if(key == BACKSPACE){
      if(word.size() > 0){
        word.remove(word.size() - 1);
        }
    }
    else if(key == TAB){
      word.clear();
    }
    else if(key == ENTER){
      String temp = "";
      String fullWord = temp.join("", word);
      if(game.checkText(fullWord)){
        word.clear();
      }else{
        textSize(50);
        text("Not a valid word!", 250, 250);
      }
    }
    else if(key != CODED){
      println(key);
      word.add(str(key));
    }
  }else{
    //do something else, or maybe nothing at all? 
  }
}

void mousePressed() { 
  for (Button b : buttons) {
    if (b.isClicked(mouseX, mouseY)) {
      if (b.label.equals("Play")) {
        if (!difficulty.isEmpty()) { 
          game = new Game(difficulty, slider.fallRate, 10); 
          game.generateGame(); 
          mainMenu = false; 
          gameInProgress = true;
          startMessageTime=millis();
          displayStartMessage=true;
        } else {
          println("Select a difficulty first!");
        }
      } else if (b.label.equals("Sound")) {
        soundOn = !soundOn;
        b.label = soundOn ? "Sound: On" : "Sound: Off";
        if (soundOn) {
          b.label="Sound: On";
          introSound.loop(); 
          } else {
            b.label="Sound: Off";
            introSound.stop(); 
          }
      } else if (b.label.equals("Quit")) {
        exit(); // Quit the game
      } else if (b.label.equals("Easy")) {
        difficulty = "Easy";
        println("Difficulty set to Easy");
      } else if (b.label.equals("Medium")) {
        difficulty = "Medium";
        println("Difficulty set to Medium");
      } else if (b.label.equals("Hard")) {
        difficulty = "Hard";
        println("Difficulty set to Hard");
      }
    }
  }
}
