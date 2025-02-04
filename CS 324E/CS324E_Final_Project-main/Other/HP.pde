class HP {
  PVector pos;
  float hp;
  PImage heartSheet;
  
  int totalFrames;
  int currentFrame;
  
  float w;
  float h;
  PImage[] heart;
  float sizeScale;
 
  
  HP(float x, float y, float max_hp) {
    this.pos = new PVector(x, y);
    this.hp = max_hp;
    this.heartSheet = loadImage("hearts.png");
    this.totalFrames = 5;
    this.currentFrame = 0;
    this.heart = new PImage[totalFrames];
    this.w = heartSheet.width / totalFrames;
    this.h = heartSheet.height;
    
    this.sizeScale = 0.35;
    
    for (int frame = 0; frame < totalFrames; frame++) {
      heart[frame] = heartSheet.get(int(frame * w), 0, int(w), int(h));
    }
  }
  
  void display() {
    for (int i = 0; i < hp; i ++) {
      pushMatrix();
      translate(pos.x + i * w * sizeScale, pos.y);
      scale(sizeScale, sizeScale);
      image(heart[currentFrame], 0, 0);
      popMatrix();
    }
  }
  
  
  
  
  
}
