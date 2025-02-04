class Game{
  ArrayList<Asteroid> asteroids;
  String[] lines;
  String diff;
  float fallV;
  float incrementV;
  int numAsteroids;
  int lives = 3;
  boolean endless;
  boolean isOver;
  int score;
  Game(String difficulty, float fallVel, int numberOfAsteroids){
    isOver = false;
    diff = difficulty;
    fallV = fallVel;
    numAsteroids = numberOfAsteroids;
    asteroids = new ArrayList<Asteroid>();
    endless = false;
    
    if(diff == "Easy"){
      //https://www.ef.edu/english-resources/english-vocabulary/top-1000-words/
      lines = loadStrings("1000common.txt"); 
      println("there are " + lines.length + " lines");
    }
    else if(diff == "Medium"){
      //https://github.com/mahsu/IndexingExercise/blob/master/5000-words.txt
      lines = loadStrings("5000common.txt");
    }
    else if(diff == "Hard"){
      //http://sherwoodschool.ru/en/vocabulary/proficiency/
      lines = loadStrings("10kcommon.txt");
    }
    else{
      println("No diff found!");
    }
  }
  
  Game(float fallVel, float incrementVel){
    isOver = false;
    asteroids = new ArrayList<Asteroid>();
    fallV = fallVel;
    incrementV = incrementVel;
    endless = true;
    numAsteroids = 10;
    lines = loadStrings("10kcommon.txt");
  }
  
  void generateGame(){
    asteroids.clear();
    score = 0;
    for(int i = 0; i < numAsteroids; i++){
      int randomIndex = int(random(lines.length));
      String randomWord = lines[randomIndex];
      float xPos = random(46.8, 454.2);
      float yPos = random(-36 * numAsteroids, 0);
      
      if(asteroids.size() > 0){
        boolean isNotUnique = true;
        while(isNotUnique){
          xPos = random(46.8, 454.2);
          yPos = random(-36 * numAsteroids, 0);
          if(checkAsteroidPos(xPos, yPos)){
            asteroids.add(new Asteroid(randomWord, fallV, xPos, yPos));
            isNotUnique = false;
          }
        }
      }else{
        Asteroid ast = new Asteroid(randomWord, fallV, xPos, yPos);
        asteroids.add(ast);
      }
    }
  }

  void updateGame(){
    text(score, 50, 450);
    if(asteroids.size() == 0){
      isOver = true;
      textSize(50);
      fill(0);
      rectMode(CENTER);
      rect(250, 233, 300, 50);
      fill(0, 255, 0);
      text("You Win!", 250, 250);
      fill(255, 255, 255);
    }else{
      if(!endless){
        for(int i = asteroids.size() - 1; i >= 0; i--){
          Asteroid temp = asteroids.get(i);
          temp.display();
          boolean isOut = temp.update();
          if(isOut){
            asteroids.get(i).startExplode();
            if(asteroids.get(i).getFinish()){
              asteroids.remove(i);
              lives -= 1;
            }
            if(lives == 0){
              
              for(int j = 0; j < asteroids.size(); j++){
                asteroids.get(j).setVelocity(0);
              }
              isOver = true;
  
            }
          }
        }
      }
      else{
        for(int i = asteroids.size() - 1; i >= 0; i--){
          Asteroid temp = asteroids.get(i);
          temp.display();
          boolean isOut = temp.update();
          if(isOut){
            asteroids.get(i).startExplode();      
            if(asteroids.get(i).getFinish()){
              asteroids.remove(i);
              lives -= 1;
            }
            if(lives == 0){           
              for(int j = 0; j < asteroids.size(); j++){
                asteroids.get(j).setVelocity(0);
              }
              isOver = true;
            }
          }
        }
      }
    }
    if(isOver && lives <= 0){
      textSize(50);
      fill(0);
      rectMode(CENTER);
      rect(250, 233, 300, 50);
      fill(255, 0, 0);
      text("You Lose!", 250, 250);
      fill(255, 255, 255);
      println("Score" + score);
    }
  }
  boolean checkAsteroidPos(float xPos, float yPos){
    for(int j = 0; j < asteroids.size(); j++){
      Asteroid tempAst = asteroids.get(j);
      float tempX = tempAst.getPos().x;
      float tempY = tempAst.getPos().y;
            
      if(abs(tempX - xPos) <= 93.6 && abs(tempY - yPos) <= 72){
        return false;
      }
    }
    return true;
  }
  boolean checkText(String text){
    for(int i = asteroids.size() - 1; i >= 0; i--){
      Asteroid tempAst = asteroids.get(i);
      //println(tempAst.getText());
      //println("user:" + text.trim());
      if(tempAst.getText().equals(text.trim())){
        asteroids.remove(i); 
        
        if(endless){
          int randomIndex = int(random(lines.length));
          String randomWord = lines[randomIndex];
          float xPos = random(46.8, 454.2);
          float yPos = random(-900, 0);
          if(asteroids.size() > 0){
            boolean isNotUnique = true;
            while(isNotUnique){
              xPos = random(46.8, 454.2);
              yPos = random(-900,0);
              if(checkAsteroidPos(xPos, yPos)){
                asteroids.add(0, new Asteroid(randomWord, fallV, xPos, yPos));
                isNotUnique = false;
              }
            }
          }
          fallV += incrementV;
          score += 1;
        }
        return true;
      }
    }
    return false;
  }
  
  boolean isFinished(){
     return isOver;
  }

}
