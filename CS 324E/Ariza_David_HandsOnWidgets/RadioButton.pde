class RadioButton extends Button {
  boolean isSelected;

  RadioButton(float x, float y, float diameter, color fillColor, String label) {
    super(x, y, diameter, fillColor, label, true);
    this.isSelected = false;
  }

  @Override
  void display() {
    fill(isSelected ? fillColor : color(200)); // Color if selected, gray otherwise
    ellipse(x, y, w, h);
    fill(255);
    textAlign(LEFT, CENTER);
    text(label, x + w / 2 + 5, y); // Place label next to the circle
  }

  void select() {
    isSelected = true;
  }

  void deselect() {
    isSelected = false;
  }
}

class RadioGroup {
  RadioButton[] buttons;

  RadioGroup(RadioButton[] buttons) {
    this.buttons = buttons;
  }

  void display() {
    for (RadioButton button : buttons) {
      button.display();
    }
  }

  void mousePressed() {
    for (RadioButton button : buttons) {
      if (button.isMouseOver()) {
        for (RadioButton b : buttons) {
          b.deselect();
        }
        button.select();
      }
    }
  }
}
