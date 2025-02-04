class Laser {

  PVector startPos;
  PVector endPos;
  PVector pos;

  int totalFrames;
  int currentFrame;
  PImage laser;
  PImage laserhead;

  Laser(float startX, float startY, float endX, float endY, int totalFrames) {
    startPos = new PVector(startX, startY);
    endPos = new PVector(endX, endY);
    pos = new PVector(startX, startY);
    this.totalFrames = totalFrames;
    currentFrame = 0;
    laser = loadImage("Laser.png");
    laserhead = loadImage("Laserhead.png"); 
  }

  void display() {
    float angle = atan2(endPos.y - startPos.y, endPos.x - startPos.x);
    float fullLength = PVector.dist(startPos, endPos);
    float currentLength = map(currentFrame, 0, totalFrames, 0, fullLength);
  
    pos = PVector.add(startPos, PVector.fromAngle(angle).mult(currentLength));
  
    pushMatrix();
    translate(startPos.x, startPos.y);
    rotate(angle);
    image(laser, 0, -laser.height / 2, currentLength, laser.height);
    popMatrix();
  
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    scale(0.5, 0.5);
    image(laserhead, -laserhead.width / 2, -laserhead.height / 2);
    popMatrix();
  
    if (currentFrame < totalFrames) {
      currentFrame++;
    }
  }



  boolean isFinished() {
    return currentFrame >= totalFrames;
  }
}
