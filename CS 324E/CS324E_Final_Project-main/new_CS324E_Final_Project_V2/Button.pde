class Button {
  float x, y, w, h;
  String label;
  color baseColor, hoverColor, currentColor;

  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.baseColor = color(200, 200, 200);
    this.hoverColor = color(150, 150, 150);
    this.currentColor = baseColor;
  }

  void display() {
    rectMode(CORNER); // for consistency
    fill(currentColor);
    rect(x, y, w, h, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
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
    return mx > x && mx < x + w && my > y && my < y + h;
  }
}
