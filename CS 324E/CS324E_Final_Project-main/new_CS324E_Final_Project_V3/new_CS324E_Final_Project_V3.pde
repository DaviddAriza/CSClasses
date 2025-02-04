import processing.sound.*;

Game game;
SoundFile introSound;
Slider slider;
Slider numberAst;
PrintWriter highS;
PImage[] explosion;
PImage asteroid;
PImage heartSheet;
PImage earthSheet;
PImage tempExplosion;
ArrayList<String> word = new ArrayList<String>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Button> endScreenButtons = new ArrayList<Button>();

String[] linesEasy;
String[] linesMedium;
String[] linesHard;
//String selectedMode = "";
String difficulty = "";
int startMessageTime = 0;
int highScore;
boolean gameInProgress = false;
boolean displayStartMessage = true;
boolean mainMenu = true;
boolean soundOn = true;

void setup() {
  linesEasy = loadStrings("1000common.txt");
  linesMedium = loadStrings("5000common.txt");
  linesHard = loadStrings("10kcommon.txt");
  heartSheet = loadImage("hearts.png");
  asteroid =  loadImage("asteroid.png");
  earthSheet = loadImage("earth 4000 pixel.png");
  explosion = new PImage[5];
  
    for(int i = 0; i < 5; i++){
        String name = "explosion" + str(i + 1) + ".png";
        println("worked:" + i);
        tempExplosion = loadImage(name);
        explosion[i] = tempExplosion;
      }
  
  size(500, 500);
  frameRate(60);
  String[] previousHighScore = loadStrings("scores.txt");
  highScore = int(previousHighScore[0]);
  frameRate(60);
  
  
  introSound = new SoundFile(this, "spaceintro.mp3"); 
  introSound.loop();
  
  
  // Main Menu Buttons
  buttons.add(new Button(200, 100, 100, 40, "Play"));
  buttons.add(new Button(200, 160, 100, 40, "Sound: On"));
  buttons.add(new Button(200, 220, 100, 40, "Quit"));
  buttons.add(new Button(60, 280, 80, 40, "Easy"));
  buttons.add(new Button(160, 280, 80, 40, "Medium"));
  buttons.add(new Button(260, 280, 80, 40, "Hard"));
  buttons.add(new Button(360, 280, 80, 40, "Endless"));
  endScreenButtons.add(new Button(100, 350, 90, 40, "Main Menu"));
  endScreenButtons.add(new Button(300, 350, 80, 40, "Quit"));
  // Main Menu slider
  slider = new Slider(255, 370, 300, 10, 20, 30, 0.5, 1.5);
  numberAst = new Slider(255, 450, 300, 10, 20, 30, 10, 50);
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
    fill(234, 206, 104);
    text("Asteroid Typer", width / 2, 50);
    fill(255, 255, 255);
    textSize(16);
    //textAlign(LEFT);
    text("High Score \nEndless: "+highScore,75,230);
    textAlign(CENTER);
    // Display buttons
    for (Button b : buttons) {
      b.checkHover(mouseX, mouseY);
      b.display();
    }
    // Display slider
    if (mousePressed) {
      slider.isSelected(mouseX, mouseY); // Check if slider is selected and update slider
      numberAst.isSelected(mouseX, mouseY); // Check if slider is selected and update slider
    }
    slider.display();
    numberAst.display();
    text("Pixel Fall Rate", 250, 340);
    text("Number of Asteroids", 250, 420);
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
          text("Game Started: " /*+ selectedMode*/ + difficulty, width / 2, height / 2);
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
    } else {
      gameInProgress = false;
      if(game.score>highScore && difficulty == "Endless"){
        highScore=game.score;
        highS = createWriter("scores.txt"); 
        highS.println(highScore);
        highS.flush();
        highS.close();
      }
    }
  }
  else if(game.isFinished()){
    for (Button b : endScreenButtons) {
      b.checkHover(mouseX, mouseY);
      b.display();
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
  if(mainMenu){
    for (Button b : buttons) {
      if (b.isClicked(mouseX, mouseY)) {
        if (b.label.equals("Play")) {
          if (!difficulty.isEmpty()) { 
            game = new Game(difficulty, slider.changeable, int(numberAst.changeable));
            game.generateGame(); 
            mainMenu = false; 
            gameInProgress = true;
            startMessageTime=millis();
            displayStartMessage=true;
          } else {
            println("Select a difficulty first!");
          }
        } else if (b.label.equals("Sound: Off") || b.label.equals("Sound: On")) {
          soundOn = !soundOn;
          //print("Sound toggle: " + soundOn); 
          //println(b.label);
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
        } else if(b.label.equals("Endless")){
          difficulty = "Endless";
          println("Difficulty set to Endless");
        }
          
      }
    }
  }else if(game.isFinished()){
    for (Button b : endScreenButtons) {
      if (b.isClicked(mouseX, mouseY)) {
        if(b.label.equals("Main Menu")){
          gameInProgress = false;
          mainMenu = true;
        }
        else if (b.label.equals("Quit")) {
          exit(); // Quit the game
        }
      }       
    }
  }
}
  
  
