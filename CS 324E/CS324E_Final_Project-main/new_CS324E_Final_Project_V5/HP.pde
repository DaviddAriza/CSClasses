class HP {
  Timer hpTimer;
  PVector pos;
  PImage[] heart;
  float hp;
  float w;
  float h;
  float sizeScale;
  int totalFrames;
  int currentFrame;
  boolean isAnimated;
  
  HP(float x, float y, float max_hp) {
    this.pos = new PVector(x, y);
    this.hp = max_hp;
    
    this.totalFrames = 5;
    this.currentFrame = 0;
    heart = new PImage[totalFrames];
    this.w = heartSheet.width / totalFrames;
    this.h = heartSheet.height;
    
    this.sizeScale = 0.35;
    
    this.hpTimer = new Timer(100);
    hpTimer.stop();
    this.isAnimated = true;
    
    for (int frame = 0; frame < totalFrames; frame++) {
      heart[frame] = heartSheet.get(int(frame * w), 0, int(w), int(h));
    }
  }
  
  void display() {
    imageMode(CORNER);
    if (hpTimer.activate()){
      currentFrame += 1;
      if (currentFrame == totalFrames) {
        currentFrame = 0;
        hp -= 1;
        isAnimated = false;
        hpTimer.stop();
      }
    }
    
    for (int i = 0; i < hp; i ++) {
      pushMatrix();
      translate(pos.x + i * w * sizeScale, pos.y);
      scale(sizeScale, sizeScale);
      if (isAnimated && i == hp - 1) {
        image(heart[currentFrame], 0, 0);
      } else {
        image(heart[0], 0, 0);
      }
      popMatrix();
    }
  }
  
  void removeHP() {
    isAnimated = true;
    hpTimer.start();
  }
}
