void setup() {
  size(400, 400); // Set the size of the canvas
  rectMode(CENTER); // Draw rectangles from their center
  noLoop(); // Prevent continuous drawing
}

void draw() {
  background(220);
  
  // Step 1: Translate sketch's origin to the center of the screen
  translate(width / 2, height / 2);
  
  // Step 2: Draw a rectangle at the center of the screen
  fill(255, 0, 0);
  rect(0, 0, 100, 50);

  // Step 3: Draw another rectangle after scaling then translating
  pushMatrix();        // Save the current transformation state
  scale(1.5);          // Scale the canvas by 1.5
  translate(150, 0);   // Translate after scaling
  fill(0, 255, 0);
  rect(0, 0, 100, 50); // Draw the second rectangle
  popMatrix();         // Restore the previous transformation state

  // Step 4: Draw another rectangle after rotating then translating
  pushMatrix();        // Save the current transformation state
  rotate(PI / 4);      // Rotate by 45 degrees (PI/4 radians)
  translate(150, 0);   // Translate after rotating
  fill(0, 0, 255);
  rect(0, 0, 100, 50); // Draw the third rectangle
  popMatrix();         // Restore the previous transformation state

  // Step 5: Draw another rectangle after translating then rotating
  pushMatrix();        // Save the current transformation state
  translate(200, 0);   // Translate first
  rotate(PI / 6);      // Rotate by 30 degrees (PI/6 radians)
  fill(255, 255, 0);
  rect(0, 0, 100, 50); // Draw the fourth rectangle
  popMatrix();         // Restore the previous transformation state

  // Step 6: Create a hierarchy where one object moves relative to another
  pushMatrix();        // Save the current transformation state
  translate(50, 50);   // Parent object translation
  fill(0, 255, 255);
  rect(0, 0, 100, 50); // Draw the parent rectangle

  // Child object relative to the parent
  translate(150, 0);   // Translate relative to the parent
  fill(255, 0, 255);
  rect(0, 0, 50, 25);  // Draw the child rectangle
  popMatrix();         // Restore the previous transformation state
}
