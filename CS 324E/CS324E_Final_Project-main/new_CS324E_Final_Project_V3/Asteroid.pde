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
  
  
  
  Asteroid(String word, float fallVel, float xPos, float yPos){
    startExplode = false;
    finishExploded = false;
    currentExplosionIndex = 0;
    pos = new PVector(xPos, yPos);
    this.word = word;
    fallV = fallVel;
   
    
    
    //float heightExp = 650;
    //float widthExp = 650;
    imageH = asteroid.height;
    imageW = asteroid.width;
    
    this.sizeScale = 1;
  }
  void display(){
    sizeScale = 0.5f + word.length() / 10.0f; // Default scale; scale up for longer words
    imageMode(CENTER);
    if(startExplode){
      
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
    }
    if(!startExplode && !inProgressExp && !finishExploded){
      textAlign(CENTER);
      textSize(20);
      text(word, pos.x, pos.y);
    
    }
    imageMode(CORNER);
  }
  boolean update(){    
    pos.y += fallV;
    //println(pos.y);
    if(pos.y  + (imageH * imageFactor)/2 >= height - 50){
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
}
