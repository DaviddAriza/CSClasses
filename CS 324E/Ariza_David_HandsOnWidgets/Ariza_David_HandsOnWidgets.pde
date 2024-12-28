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

CheckBox checkBox1, checkBox2;
RadioGroup radioGroup;
Slider bgSlider;

void setup() {
  size(600, 400);

  // Initialize buttons, checkboxes, and radio buttons
  checkBox1 = new CheckBox(50, 50, 20, 20, color(0, 255, 0), "Check 1");
  checkBox2 = new CheckBox(50, 80, 20, 20, color(0, 255, 0), "Check 2");

  RadioButton r1 = new RadioButton(200, 50, 20, color(255, 0, 0), "Option 1");
  RadioButton r2 = new RadioButton(200, 80, 20, color(0, 0, 255), "Option 2");
  radioGroup = new RadioGroup(new RadioButton[] {r1, r2});

  bgSlider = new Slider(50, 300, 400, color(100, 100, 255));
}

void draw() {
  background(bgSlider.getValue()); // Use slider value for background color

  checkBox1.display();
  checkBox2.display();
  radioGroup.display();
  bgSlider.display();
}

void mousePressed() {
  checkBox1.mousePressed();
  checkBox2.mousePressed();
  radioGroup.mousePressed();
}

void mouseDragged() {
  bgSlider.mouseDragged();
}
