import processing.sound.*;
import ddf.minim.*;

Game game;
Minim minim;
AudioPlayer introSound;
//SoundFile introSound;
AudioPlayer asteroidHitSound;
//SoundFile asteroidHitSound;
AudioPlayer laserSound;
//SoundFile laserSound;
AudioPlayer laserHitSound;
//SoundFile laserHitSound;
AudioPlayer modeSelectSound;
//SoundFile modeSelectSound;
AudioPlayer swipeLeft;
//SoundFile swipeLeft;
AudioPlayer swipeRight;
//SoundFile swipeRight;
Slider slider;
PFont font;
Tutorial tutorialPage;
Slider numberAst;
PrintWriter highS;
PImage[] explosion;
PImage asteroid;
PImage heartSheet;
PImage earthSheet;
PImage tempExplosion;
PImage mainBackground;
ArrayList<String> word = new ArrayList<String>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Button> endScreenButtons = new ArrayList<Button>();
ArrayList<Button> pauseButtons = new ArrayList<Button>();
ArrayList<Particle> particles = new ArrayList<Particle>();

RadioButton[] radioButtons = new RadioButton[4];
Button pauseButton;
String[] gameModes = {"Most Common\n1k Words", 
                      "Most Common\n5k Words", 
                      "Most Common\n10k Words", 
                      "Endless"
                     };


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
boolean tutorial = false;
boolean pause = false;
boolean soundOn = true;

void setup() {
  linesEasy = loadStrings("1000common.txt");
  linesMedium = loadStrings("5000common.txt");
  linesHard = loadStrings("10kcommon.txt");
  heartSheet = loadImage("hearts.png");
  asteroid =  loadImage("asteroid.png");
  earthSheet = loadImage("earth 4000 pixel.png");
  mainBackground = loadImage("mainBackground.jpg");
  explosion = new PImage[5];
  minim = new Minim(this);
  
  
  
    for(int i = 0; i < 5; i++){
        String name = "explosion" + str(i + 1) + ".png";
        //println("worked:" + i);
        tempExplosion = loadImage(name);
        explosion[i] = tempExplosion;
      }
  
  size(500, 500);
  frameRate(60);
  
  textFont(createFont("ArtifaktElement-Bold.otf", 12));  // Set font style
    
  String[] previousHighScore = loadStrings("scores.txt");
  highScore = int(previousHighScore[0]);
  frameRate(60);
  
  
  //introSound = new SoundFile(this, "spaceintro.mp3");
  //introSound.amp(0.3); // Make the background music quieter to show the sound effect
  //introSound.loop();
  
  introSound = minim.loadFile("spaceintro.mp3");
  introSound.setVolume(0.3);
  introSound.setGain(0.3);
  introSound.loop();
  
  /*asteroidHitSound = new SoundFile(this, "asteroid_hit_earth.mp3");
  laserSound = new SoundFile(this, "LaserSound.mp3");
  laserHitSound = new SoundFile(this, "LaserHitSound.mp3");
  modeSelectSound = new SoundFile(this, "buttonClick.mp3");
  swipeLeft = new SoundFile(this, "SwipeLeft.mp3");
  swipeRight = new SoundFile(this, "SwipeRight.mp3");
  */
  
  //attempting to use Minim library instead of SoundLibrary to increase reliability across machines.
  asteroidHitSound = minim.loadFile("asteroid_hit_earth.mp3");
  laserSound = minim.loadFile("LaserSound.mp3");
  laserHitSound = minim.loadFile("LaserHitSound.mp3");
  modeSelectSound = minim.loadFile("buttonClick.mp3");
  swipeLeft = minim.loadFile("SwipeLeft.mp3");
  swipeRight = minim.loadFile("SwipeRight.mp3");
  
  // Main Menu Buttons
  buttons.add(new Button(200, 70, 100, 40, "Play", 14, modeSelectSound));
  buttons.add(new Button(200, 125, 100, 40, "Sound: On", 14, modeSelectSound));
  buttons.add(new Button(200, 180, 100, 40, "Quit", 14, modeSelectSound));
  buttons.add(new Button(10, 10, 70, 30, "Tutorial", 12, modeSelectSound));
  //buttons.add(new Button(60, 280, 80, 40, "Most Common\n1k Words", 12));
  //buttons.add(new Button(160, 280, 80, 40, "Most Common\n5k Words", 12));
  //buttons.add(new Button(260, 280, 80, 40, "Most Common\n10k Words", 12));
  //buttons.add(new Button(360, 280, 80, 40, "Endless", 12));
  endScreenButtons.add(new Button(100, 350, 90, 40, "Main Menu", 12, modeSelectSound));
  endScreenButtons.add(new Button(300, 350, 80, 40, "Quit", 12, modeSelectSound));
  pauseButton = new Button(420, 10, 70, 30, "Pause", 12, modeSelectSound);
  pauseButtons.add(new Button(100, 250, 120, 60, "Main Menu", 14, modeSelectSound));
  pauseButtons.add(new Button(300, 250, 120, 60, "Return to Game", 14, modeSelectSound));
  
  for (int i = 0; i < radioButtons.length; i++) {
    RadioButton rb = new RadioButton(60 + 100 * i, 265, 90, 40, gameModes[i],
                                     10, modeSelectSound, radioButtons, i);
    buttons.add(rb);
    radioButtons[i] = rb;
  }
  
  // Main Menu slider
  slider = new Slider(255, 355, 300, 10, 20, 30, 0.1, 1, true, swipeLeft, swipeRight);
  numberAst = new Slider(255, 440, 300, 10, 20, 30, 10, 50, false, swipeLeft, swipeRight);
  // Initialize tutorial page
  tutorialPage = new Tutorial(width/2, 90, 18);
  //earth = new Earth();
  //earth.initializeSpinningEarth(); // Set up the earth
  //hp = new HP(10, 10, 3); // Set up the HP class
}


void draw() {
  if (tutorial) {
    background(0);
    for (Button b : buttons) {
      if (b.label == "Main Menu" || b.label == "Tutorial") {
        b.checkHover(mouseX, mouseY);
        b.display();
      }
    }
    tutorialPage.display();
  } else if (mainMenu) {
    // Display the main menu
    background(0);
    imageMode(CORNER);
    image(mainBackground, 0, 0);
    fill(255);
    textAlign(CENTER, CENTER);
    fill(234, 206, 104);
    textFont(createFont("ArtifaktElement-Bold", 24));
    text("ASTEROID TYPER", width / 2, 40);
    textFont(createFont("ArtifaktElement-Regular", 18));
    fill(169, 199, 206);
    text("Game Mode", width / 2, 245);
    fill(255, 255, 255);
    textSize(16);
    //textAlign(LEFT);
    text("High Score \nEndless: "+highScore,75,230);
    textAlign(CENTER);
    // Display buttons
    for (Button b : buttons) {
      if (difficulty.isEmpty()) {
        if (b.label == "Play") {
          fill(169, 199, 206);
          textFont(createFont("ArtifaktElement-Regular", 16));
          text("Select a Game Mode to Start", width/2, 95);
        } else {
          b.checkHover(mouseX, mouseY);
          b.display();
        }
      } else {
        b.checkHover(mouseX, mouseY);
        b.display();
      }
    }
    // Display slider
    if (mousePressed) {
      slider.isSelected(mouseX, mouseY); // Check if slider is selected and update slider
      numberAst.isSelected(mouseX, mouseY); // Check if slider is selected and update slider
    }
    slider.display();
    numberAst.display();
    textFont(createFont("ArtifaktElement-Regular", 18));
    text("Pixel Fall Rate", 250, 325);
    text("Number of Asteroids", 250, 410);
  } else if (gameInProgress) {
    if (pause) {
      rectMode(CENTER);
      //rect(0, 0, width, height);
      rect(width/2, 150, 180, 40);
      fill(169, 199, 206);
      textFont(createFont("ArtifaktElement-BOLD", 24));
      textMode(CENTER);
      text("GAME PAUSED", width/2, 150);
      for (Button b : pauseButtons) {
        b.checkHover(mouseX, mouseY);
        b.display();
      }
    } else {
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
      pauseButton.checkHover(mouseX, mouseY);
      pauseButton.display();
    }
  } else if(game.isFinished()){
    for (Button b : endScreenButtons) {
      word.clear();
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
    else if(key == ' ') {
      pause = true;
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
            game = new Game(difficulty, slider.changeable, int(numberAst.changeable), asteroidHitSound, laserSound, laserHitSound);
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
            introSound.unmute(); 
            } else {
              b.label="Sound: Off";
              introSound.mute(); 
            }
        } else if (b.label.equals("Quit")) {
          exit(); // Quit the game
        } else if (b.label.equals("Most Common\n1k Words")) {
          difficulty = "Most Common 1k Words";
          println("Difficulty set to Most Common 1k Words");
        } else if (b.label.equals("Most Common\n5k Words")) {
          difficulty = "Most Common 5k Words";
          println("Difficulty set to Most Common 5k Words");
        } else if (b.label.equals("Most Common\n10k Words")) {
          difficulty = "Most Common 10k Words";
          println("Difficulty set to Most Common 10k Words");
        } else if(b.label.equals("Endless")){
          difficulty = "Endless";
          println("Difficulty set to Endless");
        } else if(b.label.equals("Tutorial")){
          tutorial = true;
          b.label = "Main Menu";
        } else if(b.label.equals("Main Menu")){
          tutorial = false;
          b.label = "Tutorial";
        }
          
      }
    }
  } else if (gameInProgress) {
    if (!pause) {
      if (pauseButton.isClicked(mouseX, mouseY)) {
        pause = true;
      }
    } else {
      for (Button b : pauseButtons) {
        if (b.isClicked(mouseX, mouseY)) {
          if(b.label.equals("Main Menu")){
            word.clear();
            gameInProgress = false;
            pause = false;
            mainMenu = true;
          } else if (b.label.equals("Return to Game")) {
            pause = false;
          }
        }
      }
    }
  } else if(game.isFinished()){
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

void mouseReleased() { 
  if(mainMenu){
    for (Button b : buttons) {
      b.isReleased();
    }
    slider.mouse_release();
    numberAst.mouse_release();
    
  }else if(game.isFinished()){
    for (Button b : endScreenButtons) {
      b.isReleased();
    }
  }
}
  
