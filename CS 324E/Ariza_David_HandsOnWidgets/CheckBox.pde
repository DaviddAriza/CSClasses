class CheckBox extends Button {
  boolean isChecked;

  CheckBox(float x, float y, float w, float h, color fillColor, String label) {
    super(x, y, w, h, fillColor, label);
    this.isChecked = false;
  }

  @Override
  void display() {
    fill(isChecked ? fillColor : color(200)); // Show color if checked, gray otherwise
    rect(x, y, w, h);
    fill(255);
    textAlign(LEFT, CENTER);
    text(label, x + w + 5, y + h / 2); // Place label next to the checkbox
  }

  @Override
  void mousePressed() {
    if (isMouseOver()) {
      isChecked = !isChecked; // Toggle the state
    }
  }
}
