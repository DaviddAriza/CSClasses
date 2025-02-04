Game game;
ArrayList<String> word = new ArrayList<String>();
boolean gameInProgress = false;

//Earth earth;
//HP hp; // Initialize the HP class


void setup() {
  size(500, 500);
  frameRate(60);
  
  game = new Game(0.5, 0.01);
  game.generateGame();
  gameInProgress = true;
  
  //earth = new Earth();
  //earth.initializeSpinningEarth(); // Set up the earth
  //hp = new HP(10, 10, 3); // Set up the HP class
}


void draw() {
  
  
  //hp.display(); // Display the HP hearts
  /*
  // Update earth animation grame
  if (earthTimer.activate()) {
    earthCurrentFrame = (earthCurrentFrame + 1) % earthFrames;
    earthTimer.start();
  }
  */
  //earth.displaySpinningEarth();
  
  if(gameInProgress){
    background(0);
    game.updateGame();
    if(!game.isFinished()){
      String temp = "";
      String fullWord = temp.join("", word);
      textSize(50);
      text(fullWord, 250, 400);
      if(game.checkText(fullWord)){
        word.clear();
      }
    }else{
      gameInProgress = false;
      //need to display some HUD asking user to play again. 
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
