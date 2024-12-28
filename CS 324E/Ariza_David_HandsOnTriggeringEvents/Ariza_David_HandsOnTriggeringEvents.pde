void setup() {
  size(1000, 1000);
  background(255); 
}

void draw() {
  if (mousePressed) {
    if(mouseButton == LEFT) {
      background(255, 0, 0);
    } else if (mouseButton == RIGHT) {
      background(0, 0, 255);
    } else if (mouseButton == CENTER) {
      background(0, 255, 0);
    }
  }
  if (keyPressed) {
    if(key == 'c') {
      stroke(100, 100, 0);
      fill(100, 100, 0);
      ellipse(500, 400, 40, 30);
    } else if(key == 's') {
      stroke(0, 100, 100);
      fill(0, 100, 100);
      rect(400, 700, 80, 100);
    }
  }
}

void mousePressed() {
    if(mouseButton == LEFT) {
    background(255, 0, 0);
  } else if (mouseButton == RIGHT) {
    background(0, 0, 255);
  } else if (mouseButton == CENTER) {
    background(0, 255, 0);
  }
}

void mouseMoved() {
  stroke(0);
  fill(0);
  strokeWeight(10);
  point(mouseX, mouseY);
}



void keyPressed(){
  if(key == 'c') {
    stroke(100, 100, 0);
    fill(100, 100, 0);
    ellipse(500, 400, 40, 30);
  } else if(key == 's') {
    stroke(0, 100, 100);
    fill(0, 100, 100);
    rect(400, 700, 80, 100);
  }
}
