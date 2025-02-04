class Slider {
  PVector pos;
  float fallRate;
  float t_x;
  float w, h, t_w, t_h;
  float max, min;
  
  Slider(float x, float y, float wid, float hei, float t_wid, float t_hei, float min, float max) {
    pos = new PVector(x, y);
    this.w = wid;
    this.h = hei;
    this.t_w = t_wid;
    this.t_h = t_hei;
    this.t_x = pos.x;
    this.max = max;
    this.min = min;
    this.fallRate = min + (max - min) / 2;
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
    text(str(fallRate), t_x, pos.y + t_h);
  }
  
  boolean mouse_check(float mX, float mY) {
    return (mX >= pos.x - w/2 && mX <= pos.x + w/2 && mY >= pos.y - h/2 && mY <= pos.y + h/2);
  }
  
  void isSelected(float mouse_x, float mouse_y) {
    if (mouse_check(mouse_x, mouse_y)) {
      t_x = mouse_x;
    }
    fallRate = float(nf(min + (t_x - (pos.x - w/2)) / w * (max-min), 0, 1));
  }
  
};
