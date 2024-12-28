PFont font;
String typedText = "";

void setup() {
  size(1000, 1000);
  font = createFont("Arial", 32);
  textFont(font);
  textSize(32);
  textAlign(LEFT, TOP);
}

void draw() {
  background(255);
  fill(0);
  

  text(typedText, 50, 50);
}

void keyTyped() {
  if (key == BACKSPACE) {
    if (typedText.length() > 0) {
      typedText = typedText.substring(0, typedText.length() - 1);
    }
  } else {
    typedText += key;
  }
}
