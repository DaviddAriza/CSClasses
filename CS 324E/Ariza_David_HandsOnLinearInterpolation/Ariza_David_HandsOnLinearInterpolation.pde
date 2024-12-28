PVector startPos, endPos, currentPos;
float t = 0;
float stepSize = 0.01; // Step size controls speed

void setup() {
  size(400, 400);
  startPos = new PVector(50, height/2);
  endPos = new PVector(width - 50, height/2);
  currentPos = startPos.copy();
}

void draw() {
  background(255);

  // Call move method
  move(startPos, endPos, stepSize);
  
  // Draw a shape at the current position
  ellipse(currentPos.x, currentPos.y, 50, 50);
}

void move(PVector start, PVector end, float step) {
  currentPos.x = lerp(start.x, end.x, t);
  currentPos.y = lerp(start.y, end.y, t);
  
  t += step;
  if (t > 1) {
    t = 0; // Reset t once it reaches 1
  }
}
