class RadioButton extends Button {
  RadioButton[] group;
  int id;
  boolean isChecked;
  
  RadioButton(float x, float y, float w, float h, String label, int textSize,
              SoundFile clicked, RadioButton[] myButtons, int button_id) {
    super(x, y, w, h, label, textSize, clicked);
    this.group = myButtons;
    this.id = button_id;
    this.isChecked = false;
  }
  
  void display() {
    rectMode(CORNER); // for consistency
    if (isChecked){
      noFill();
      strokeWeight(7);
      stroke(234, 206, 104);
    } else {
      noStroke();
    }
    if (state == 1) {
      fill(currentColor);
      rect(x + 2.5, y + 2.5, w - 5, h - 5, 10);
    } else {
      fill(currentColor);
      rect(x, y, w, h, 10);
    }
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(label, x + w / 2, y + h / 2);
  }
  
  boolean isClicked(float mx, float my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      for (int i = 0; i < group.length; i++) {
        group[i].isChecked = false; // Uncheck all other buttons
      }
      state = 1;
      isChecked = true; // Only the clicked button is checked
      clickSound.play(); // play click sound
    }
    return mx > x && mx < x + w && my > y && my < y + h;
}

  
  void isReleased() {
    state = 0;
  }

}
