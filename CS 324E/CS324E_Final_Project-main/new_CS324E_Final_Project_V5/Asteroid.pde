class Asteroid{
  //float xpos, ypos, fallV;
  PVector pos;
  String word;
  float fallV;
  float imageFactor = 0.1;
  float imageH, imageW;
  float startTime;
  float nextTime;
  float sizeScale; // For scaling purposes
  int currentExplosionIndex;
  boolean startExplode;
  boolean inProgressExp;
  boolean finishExploded;
  
  Timer warningTimer;
  PImage warningSignsSheet;
  PImage[] warningSigns;
  int warningSignsFrame;
  int warningSignsMaxFrame;
  float warningSignsW;
  boolean isWarning;
  
  Timer laserHitTimer;
  PImage[] laserHit;
  int laserHitFrame;
  int laserHitMaxFrame;
  boolean beingHit;
  
  boolean active;
  boolean laserActive;
  Laser laser;
  
  SoundFile asteroidHitSound;
  
  Asteroid(String word, float fallVel, float xPos, float yPos, SoundFile asteroidHitSound){
    startExplode = false;
    finishExploded = false;
    currentExplosionIndex = 0;
    pos = new PVector(xPos, yPos);
    this.word = word;
    fallV = fallVel;
    
    this.asteroidHitSound = asteroidHitSound;
    
    
    //float heightExp = 650;
    //float widthExp = 650;
    imageH = asteroid.height;
    imageW = asteroid.width;
    
    this.sizeScale = 1;
    
    warningTimer = new Timer(100);
    warningTimer.stop();
    warningSignsSheet = loadImage("warningSigns.png");
    warningSignsFrame = 0;
    warningSignsMaxFrame = 48;
    warningSignsW = warningSignsSheet.width / warningSignsMaxFrame;
    isWarning = false;
    
    warningSigns = new PImage[warningSignsMaxFrame];
    for (int i = 0; i < warningSignsMaxFrame; i++) {
      warningSigns[i] = warningSignsSheet.get(int(i * warningSignsW), 0,
                                              int(warningSignsW), int(warningSignsSheet.height));                                     
    }
    
    laserHitTimer = new Timer(100);
    laserHitTimer.stop();
    laserHitFrame = 0;
    laserHitMaxFrame = 4;
    beingHit = false;
    laserHit = new PImage[laserHitMaxFrame];
    for(int i = 0; i < laserHitMaxFrame; i++){
        String name = "LaserHit" + str(i + 1) + ".png";
        laserHit[i] = loadImage(name);
    }
                                              
    active = true;
    laserActive = false;
  }
    
  void display(){
    sizeScale = 0.2f + word.length() / 10.0f; // Default scale; scale up for longer words
    imageMode(CENTER);
    if(startExplode){
      
      //if (!asteroidHitSound.isPlaying()) { // Play hitting earth sound
      asteroidHitSound.play();
      //}
      
      sizeScale *= 2; // Change the scale to make the explosion larger
      
      startTime = millis();
      println("started");
      image(explosion[currentExplosionIndex], pos.x, pos.y, 
            imageW * imageFactor * sizeScale, imageH * imageFactor * sizeScale);
      currentExplosionIndex += 1;
      startExplode = false;
      inProgressExp = true;
    }
    
    
    if(inProgressExp){
      
      sizeScale *= 2; // Change the scale to make the explosion larger
      
      float tempTime = millis();
      if(currentExplosionIndex == 4){
        inProgressExp = false;
        finishExploded = true;
      }
      else if(tempTime - startTime >= 60){
        startTime = tempTime;
        image(explosion[currentExplosionIndex], pos.x, pos.y, 
            imageW * imageFactor * sizeScale, imageH * imageFactor * sizeScale);
        currentExplosionIndex += 1;
      }
    }else{
      image(asteroid, pos.x, pos.y, 
            imageW * imageFactor * sizeScale, imageH * imageFactor * sizeScale);
      if (pos.y > height - 200) {
        if (warningTimer.timerState) {
          if (warningTimer.activate()) {
            warningSignsFrame += 1;
            if (warningSignsFrame >= 48) {
              warningSignsFrame = 0;
            }
            warningTimer.stop();
            warningTimer.start();
          }
        } else {
          warningTimer.start();
        }
        
        imageMode(CENTER);
        pushMatrix();
        translate(pos.x, pos.y - sizeScale * imageH * imageFactor / 3 * 2);
        scale(sizeScale / 5, sizeScale / 5);
        image(warningSigns[warningSignsFrame], 0, 0);
        popMatrix();

      }

    }
    
    if (beingHit) {
      if (!laserHitTimer.timerState) {
          laserHitTimer.start();
      }
      if (laserHitTimer.activate()) {
        laserHitFrame++;
      }
      imageMode(CENTER);
              pushMatrix();
              translate(pos.x, pos.y);
              scale(0.3 + word.length() * 0.05);
              image(laserHit[laserHitFrame], 0, 0);
              popMatrix();
      if (laserHitFrame >= laserHitMaxFrame - 1) {
          laserHitTimer.stop();
          beingHit = false;
          active = false;
      }
  }


    
    if(!startExplode && !inProgressExp && !finishExploded){
      fill(255);
      textAlign(CENTER);
      textSize(14);
      text(word, pos.x, pos.y);
    }
    imageMode(CORNER);
    
    if (laserActive) {
      laser.display();
      if (laser.isFinished()) {
        beingHit = true;
        laserActive = false;
      }
    }
  }
  
  
  boolean update(){ 
    pos.y += fallV;
    //println(pos.y);
    if(pos.y  + (imageH * imageFactor)/2 >= height - 50 && !beingHit){
      //println(pos.y + imageH/2);
      fallV = 0;
      return true; 
    }
    return false; 
  }
  void startExplode(){
    if(!inProgressExp && !finishExploded){
      startExplode = true; 
    }
  }
  boolean getFinish(){
    return finishExploded;
  }
  PVector getPos(){
    return pos;
  }
  String getText(){
    return word;
  }
  void setVelocity(float vel){
    fallV = vel;
  }
  
  void generateLaser() {
    laser = new Laser(width/2, 420, pos.x, pos.y + 20 * fallV, 20);
    laserActive = true;
  }
  
  
}
