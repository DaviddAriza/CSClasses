class Slider {
  PVector pos;
  float changeable;
  float t_x;
  float w, h, t_w, t_h;
  float max, min;
  boolean isSliding;
  
  boolean allowFloat;
  
  //SoundFile swipeLeft;
  //SoundFile swipeRight;
  AudioPlayer swipeLeft;
  AudioPlayer swipeRight;
  
  Slider(float x, float y, float wid, float hei, float t_wid, float t_hei,
         float min, float max, boolean allowFloat, AudioPlayer swipeLeft, AudioPlayer swipeRight) {
    pos = new PVector(x, y);
    this.w = wid;
    this.h = hei;
    this.t_w = t_wid;
    this.t_h = t_hei;
    this.t_x = pos.x;
    this.max = max;
    this.min = min;
    this.allowFloat = allowFloat;
    this.changeable = float(nf((min + (max - min) / 2), 0, 1));
    
    this.swipeLeft = swipeLeft;
    this.swipeRight = swipeRight;
    isSliding = false;
  }
  
  void display() {
    rectMode(CENTER);
    fill(108, 131, 137); 
    stroke(139, 164, 170);
    strokeWeight(5);
    rect(pos.x, pos.y, w, h);
    fill(169, 199, 206);
    noStroke();
    rect(t_x, pos.y, t_w, t_h);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(str(changeable), t_x, pos.y + t_h);
  }
  
  boolean mouse_check(float mX, float mY) {
    if (mX >= pos.x - w/2 && mX <= pos.x + w/2 && mY >= pos.y - h/2 && mY <= pos.y + h/2) {
      isSliding = true;
    }
    return isSliding;
  }
  
  void mouse_release() {
    isSliding = false;
  }
  
  void isSelected(float mouse_x, float mouse_y) {
    if (mouse_check(mouse_x, mouse_y)){
      if (mouse_x < t_x) {
        swipeRight.mute();
        if (!swipeLeft.isPlaying()) {
          swipeLeft.unmute();
          swipeLeft.play();
        }
      } else if (mouse_x > t_x) {
        swipeLeft.mute();
        if (!swipeRight.isPlaying()) {
          swipeRight.unmute();
          swipeRight.play();
        }
      }
      if (mouse_x >= pos.x - w/2 && mouse_x <= pos.x + w/2) {
          t_x = mouse_x;
      }
    }
    if (allowFloat) {
      changeable = float(nf(min + (t_x - (pos.x - w/2)) / w * (max-min), 0, 1));
    } else {
      changeable = int(nf(min + (t_x - (pos.x - w/2)) / w * (max-min), 0, 1));
    }
  }
  
};
