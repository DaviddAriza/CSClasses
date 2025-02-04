class Game{
  ArrayList<Asteroid> asteroids;
  ArrayList<Asteroid> craterInfo;
  ArrayList<Laser> lasers;
  PImage crater;
  PImage laserMachine;
  String[] lines;
  String diff;
  float fallV;
  float incrementV;
  int numAsteroids;
  int lives = 3;
  int score;
  boolean endless;
  boolean isOver;
  Earth earth; // Set up the earth
  HP hp;
  WPM wpmCounter;
  
  
  
  SoundFile asteroidHitSound;
  SoundFile laserSound;
  SoundFile laserHitSound;
  
  Game(String difficulty, float fallVel, int numberAsteroid, SoundFile asteroidHitSound, SoundFile laserSound, SoundFile laserHitSound){
    isOver = false;
    diff = difficulty;
    fallV = fallVel;
    //numAsteroids = numberOfAsteroids;
    asteroids = new ArrayList<Asteroid>();
    endless = false;
    incrementV = 0.01;
    earth = new Earth();
    earth.initializeEarth();
    numAsteroids = numberAsteroid;
    
    craterInfo = new ArrayList<Asteroid>();
    lasers = new ArrayList<Laser>();
    crater = loadImage("crater.png"); // https://www.istockphoto.com/vector/hole-gm455309553-15963343
    crater = crater.get(0, 0, crater.width, 250);
    laserMachine = loadImage("LaserMachine.png");
  
    hp = new HP(10, 10, 3); // Initialize the HP class // Set up the HP class
    wpmCounter = new WPM(1000);
    this.asteroidHitSound = asteroidHitSound;
    this.laserSound = laserSound;
    this.laserHitSound = laserHitSound;
    
    if(diff == "Most Common 1k Words"){
      //https://www.ef.edu/english-resources/english-vocabulary/top-1000-words/
      lines = linesEasy;
      println("there are " + lines.length + " lines");
    }
    else if(diff == "Most Common 5k Words"){
      //https://github.com/mahsu/IndexingExercise/blob/master/5000-words.txt
      lines = linesMedium;
    }
    else if(diff == "Most Common 10k Words"){
      //http://sherwoodschool.ru/en/vocabulary/proficiency/
      lines = linesHard;
    }
    else if(diff == "Endless"){
      //https://github.com/mahsu/IndexingExercise/blob/master/5000-words.txt
      lines = linesMedium;
      endless = true;
    }
    else{
      println("No diff found!");
    }
  }

  void generateGame(){
    asteroids.clear();
    craterInfo.clear();
    score = 0;
    wpmCounter.reset();
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
            asteroids.add(new Asteroid(randomWord, fallV, xPos, yPos, asteroidHitSound));
            isNotUnique = false;
          }
        }
      }else{
        Asteroid ast = new Asteroid(randomWord, fallV, xPos, yPos, asteroidHitSound);
        asteroids.add(ast);
      }
    }
  }

  void updateGame(){
    earth.displayEarth();
    textAlign(LEFT);
    if(endless){
      text(" Game Score: " + score,0,480);
      text("WPM:" + wpmCounter.getWPM(), 10, 450);
      
      wpmCounter.updateWPM();
      
    }else{
      text(" Amount Cleared: " + score + "/" + numAsteroids, 0, 480);
      text("WPM:" + wpmCounter.getWPM(), 10, 450);
      
      wpmCounter.updateWPM();
      
    }
    
    textAlign(CENTER);
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
              craterInfo.add(asteroids.get(i));
              asteroids.remove(i);
              lives -= 1;
              hp.removeHP();
            }
            if(lives == 0){
              
              for(int j = 0; j < asteroids.size(); j++){
                asteroids.get(j).setVelocity(0);
              }
              isOver = true;
  
            }
          }
        }
        for(int i = asteroids.size() - 1; i >= 0; i--) { // Remove asteroids if they are shot
          if (asteroids.get(i).beingHit && !laserHitSound.isPlaying()) {
            laserHitSound.play();
          }
          if (!asteroids.get(i).active) {
            asteroids.remove(i);
          }
        }
        for(int i = 0; i < craterInfo.size(); i++){
          Asteroid craterAsteroid = craterInfo.get(i);
          imageMode(CENTER);
          pushMatrix();
          translate(craterAsteroid.pos.x,craterAsteroid.pos.y);
          scale(craterAsteroid.sizeScale / 5, craterAsteroid.sizeScale / 5);
          image(crater, 0, 0);
          popMatrix();
          imageMode(CORNER);
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
              craterInfo.add(asteroids.get(i));
              asteroids.remove(i);
              lives -= 1;
              hp.removeHP();
            }
            if(lives == 0){           
              for(int j = 0; j < asteroids.size(); j++){
                asteroids.get(j).setVelocity(0);
              }
              isOver = true;
            }
          }
        }
        for (int i = asteroids.size() - 1; i >= 0; i--) {
          if (asteroids.get(i).beingHit) {
              if (!asteroids.get(i).laserHitTimer.timerState && asteroids.get(i).laserHitFrame < 2) {
                  if (!laserHitSound.isPlaying()) {
                      laserHitSound.play();
                  }
                  asteroids.get(i).laserHitTimer.start();
              }
              asteroids.get(i).display();
          }
          if (!asteroids.get(i).active) {
              asteroids.remove(i);
          }
      }

        
        for(int i = 0; i < craterInfo.size(); i++){
          Asteroid craterAsteroid = craterInfo.get(i);
          pushMatrix();
          imageMode(CENTER);
          translate(craterAsteroid.pos.x,craterAsteroid.pos.y + 10);
          scale(min(craterAsteroid.sizeScale / 5, 1.5), min(craterAsteroid.sizeScale / 5, 1.5));
          image(crater, 0, 0);
          popMatrix();
          imageMode(CORNER);
        }
      }
    }
    if(isOver && lives <= 0){
      hp.hp = 0;
      if(score>highScore && endless) {
        highScore=score;
      }
      textSize(50);
      fill(0);
      rectMode(CENTER);
      rect(250, 233, 300, 50);
      fill(255, 0, 0);
      text("You Lose!", 250, 250);
      fill(255, 255, 255);
      
      //high score (only kept track of if doing endless mode)
      if(endless){
        rectMode(CENTER);
        fill(0);
        rect(250, 290, 300, 50);
        fill(255);
        textSize(30); 
        text("High Score: " + highScore, 250, 300);
        
      }else{
        rectMode(CENTER);
        fill(0);
        rect(250, 290, 350, 50);
        fill(255);
        textSize(30); 
        text("Amount Cleared: " + score + "/" + numAsteroids, 250, 300);
      }
      println("Score" + score);
    }
    hp.display(); // Display the HP hearts
    
    /*for(int i = 0; i < lasers.size(); i++){
      lasers.get(i).display();
    }
    for(int i = 0; i < lasers.size(); i++){
      if (lasers.get(i).currentFrame >= lasers.get(i).totalFrames) {
        lasers.remove(i);
      }
    }*/
    imageMode(CORNER);
    image(laserMachine, width/2 - laserMachine.width/2, 410); // Display laser machine
  }
  
  boolean checkAsteroidPos(float xPos, float yPos){
    for(int j = 0; j < asteroids.size(); j++){
      Asteroid tempAst = asteroids.get(j);
      float tempX = tempAst.getPos().x;
      float tempY = tempAst.getPos().y;
      if((abs(tempX - xPos) <= 93.6 && abs(tempY - yPos) <= 72)){
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
      String retrievedWord = tempAst.getText();
      if(retrievedWord.toLowerCase().equals(text.trim().toLowerCase()) && tempAst.pos.y > 0){
        //lasers.add(new Laser(width/2, 400, tempAst.pos.x, tempAst.pos.y + 50 * fallV)); // Add a laser object
        asteroids.get(i).generateLaser();
        laserSound.play();
        //asteroids.remove(i);
        score+=1;
        
        wpmCounter.incrementWords();
        
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
                asteroids.add(0, new Asteroid(randomWord, fallV, xPos, yPos, asteroidHitSound));
                isNotUnique = false;
              }
            }
          }
          fallV += incrementV;
        }
        return true;
      }
    }
    return false;
  }
  
  boolean isFinished(){
     return isOver;
  }

/*Game(float fallVel, float incrementVel){
    isOver = false;
    asteroids = new ArrayList<Asteroid>();
    fallV = fallVel;
    incrementV = incrementVel;
    endless = true;
    numAsteroids = 10;
    lines = loadStrings("10kcommon.txt");
    
    earth = new Earth();
    earth.initializeSpinningEarth(); // Set up the earth
    hp = new HP(10, 10, 3); // Set up the HP class
  }*/

/*Game(String difficulty, float fallVel, int numberOfAsteroids){
    isOver = false;
    diff = difficulty;
    fallV = fallVel;
    numAsteroids = numberOfAsteroids;
    asteroids = new ArrayList<Asteroid>();
    endless = false;
    incrementV = 0.01;
    
    earth = new Earth();
    earth.initializeSpinningEarth(); // Set up the earth
    hp = new HP(10, 10, 3); // Set up the HP class
    
    
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
    else if(diff == "Endless"){
      //https://github.com/mahsu/IndexingExercise/blob/master/5000-words.txt
      lines = loadStrings("5000common.txt");
      endless = true;
    }
    else{
      println("No diff found!");
    }
  }*/

}
