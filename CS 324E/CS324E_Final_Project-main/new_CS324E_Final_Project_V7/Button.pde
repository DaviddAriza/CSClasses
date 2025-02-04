class Button {
  float x, y, w, h;
  String label;
  color baseColor, hoverColor, currentColor;
  int textSize;
  //SoundFile clickSound;
  AudioPlayer clickSound;
  int state;

  Button(float x, float y, float w, float h, String label, int textSize, AudioPlayer clickSound) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.textSize = textSize;
    this.clickSound = clickSound;
    this.baseColor = color(200, 200, 200);
    this.hoverColor = color(150, 150, 150);
    this.currentColor = baseColor;
    
    this.state = 0; // 0 = default, 1 = clicked
  }

  void display() {
    rectMode(CORNER); // for consistency
    fill(currentColor);
    if (state == 1) {
      rect(x + 2.5, y + 2.5, w - 5, h - 5, 10);
    } else {
      rect(x, y, w, h, 10);
    }
    fill(0);
    textFont(createFont("ArtifaktElement-Regular", 12));
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(label, x + w / 2, y + h / 2);
  }

  void checkHover(float mx, float my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      currentColor = hoverColor;
    } else {
      currentColor = baseColor;
    }
  }

  boolean isClicked(float mx, float my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      state = 1;
      clickSound.play(); // play click sound
    }
    return mx > x && mx < x + w && my > y && my < y + h;
  }
  
  void isReleased() {
    state = 0;
  }
  
}
