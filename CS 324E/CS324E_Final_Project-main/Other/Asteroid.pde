class Asteroid{
  //float xpos, ypos, fallV;
  PVector pos;
  float fallV;
  
  String word;
  PImage asteroid;
  PImage explosionSheet;
  PImage temp;
  PImage[] explosion;
  float imageFactor = 0.1;
  float imageH, imageW;
  boolean isExploded;
  boolean inProgressExp;
  boolean finishExploded;
  int currentExplosionIndex;
  float startTime;
  float nextTime;
  Asteroid(String word, float fallVel, float xPos, float yPos){
    //xpos = xPos;
    //ypos = yPos;
    isExploded = false;
    finishExploded = false;
    currentExplosionIndex = 0;
    pos = new PVector(xPos, yPos);
    this.word = word;
    fallV = fallVel;
    //https://stock.adobe.com/images/Cartoon-flying-space-asteroid-with-craters-and-bumps.-Vector-isolated-stone./
    //633745224?as_campaign=TinEye&as_content=tineye_match
    asteroid = loadImage("asteroid.png"); 
    //https://www.pngegg.com/en/png-eclaj
    explosionSheet = loadImage("explosion.png");
    explosion = new PImage[5];
    
    float heightExp = 650;
    float widthExp = 650;
    
    for(int i = 0; i < 5; i++){
      String name = "explosion" + str(i + 1) + ".png";
      temp = loadImage(name);
      explosion[i] = temp;
    }
    imageH = asteroid.height;
    imageW = asteroid.width;
  }
  void display(){
    
    if(isExploded){
      startTime = millis();
      println("started");
      asteroid = explosion[currentExplosionIndex];
      currentExplosionIndex += 1;
      isExploded = false;
      inProgressExp = true;
    }
    if(inProgressExp){
      float tempTime = millis();
      if(currentExplosionIndex == 4){
        inProgressExp = false;
        finishExploded = true;
      }
      else if(tempTime - startTime >= 60){
        startTime = tempTime;
        asteroid = explosion[currentExplosionIndex];
        currentExplosionIndex += 1;
      }
    }
    
    imageMode(CENTER);
    image(asteroid, pos.x, pos.y, imageW * imageFactor, imageH * imageFactor);
    if(!isExploded && !inProgressExp && !finishExploded){
      textAlign(CENTER);
      textSize(20);
      text(word, pos.x, pos.y);
    }
    
  }
  boolean update(){    
    pos.y += fallV;
    //println(pos.y);
    if(pos.y  + (imageH * imageFactor)/2 >= height){
      //println(pos.y + imageH/2);
      fallV = 0;
      return true; 
    }
    return false; 
  }
  void startExplode(){
    if(!inProgressExp && !finishExploded){
      isExploded = true; 
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
