class Slider {
  float x, y, w;
  float sliderX;
  color sliderColor;

  Slider(float x, float y, float w, color sliderColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.sliderColor = sliderColor;
    this.sliderX = x; // Start at the left end
  }

  void display() {
    stroke(0);
    line(x, y, x + w, y); // Slider track
    fill(sliderColor);
    ellipse(sliderX, y, 20, 20); // Slider knob
  }

  void mouseDragged() {
    if (mouseX > x && mouseX < x + w) {
      sliderX = mouseX; // Move the knob
    }
  }

  float getValue() {
    return map(sliderX, x, x + w, 0, 255); // Map slider position to 0-255
  }
}
