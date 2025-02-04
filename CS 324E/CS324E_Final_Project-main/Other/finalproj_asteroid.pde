Game game;
ArrayList<String> word = new ArrayList<String>();
boolean gameInProgress = false;

void setup(){
  size(500, 500);
  
  //Need to find a way to only generate game AFTER user has selected a difficulty option from menu. Maybe
  //we can't instantiate the game in setup? 
  //game = new Game("Hard", 0.8, 5);
  game = new Game(0.5, 0.01);
  game.generateGame();
  gameInProgress = true;
}

void draw(){
  if(gameInProgress){
    background(210);
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
