class Button {
  float x, y;
  float w, h;
  color fillColor;
  String label;
  boolean isCircular;

  // Constructor for rectangular buttons
  Button(float x, float y, float w, float h, color fillColor, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fillColor = fillColor;
    this.label = label;
    this.isCircular = false; // Default to rectangular
  }

  // Constructor for circular buttons
  Button(float x, float y, float diameter, color fillColor, String label, boolean isCircular) {
    this.x = x;
    this.y = y;
    this.w = diameter;
    this.h = diameter;
    this.fillColor = fillColor;
    this.label = label;
    this.isCircular = isCircular;
  }

  // Display the button
  void display() {
    fill(fillColor);
    if (isCircular) {
      ellipse(x, y, w, h);
    } else {
      rect(x, y, w, h);
    }
    fill(255);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }

  boolean isMouseOver() {
    if (isCircular) {
      float d = dist(mouseX, mouseY, x, y);
      return d < w / 2;
    } else {
      return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
    }
  }

  void mousePressed() {
    if (isMouseOver()) {
      fillColor = color(random(255), random(255), random(255));
      background(random(255));
    }
  }
}

Button rectButton;
Button circleButton;

void setup() {
  size(600, 400);
  rectButton = new Button(100, 150, 120, 60, color(100, 150, 250), "Rect Button");
  circleButton = new Button(400, 150, 100, color(250, 100, 150), "Circle Button", true);
}

void draw() {

  rectButton.display();
  circleButton.display();
}

void mousePressed() {
  rectButton.mousePressed();
  circleButton.mousePressed();
}
