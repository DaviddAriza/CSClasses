// Declare color array to store shades of gray (achromatic colors)
color[] achromaticColors = new color[5];

void setup() {
  size(400, 400);
  background(200);
  // Initialize achromatic colors
  achromaticColors[0] = color(255);  // White
  achromaticColors[1] = color(200);  // Light gray
  achromaticColors[2] = color(150);  // Medium gray
  achromaticColors[3] = color(100);  // Dark gray
  achromaticColors[4] = color(0);    // Black

  // Example of using blend mode
  blendMode(ADD);
  drawShapes();
}

void drawShapes() {
  // Use achromatic colors with fill and stroke
  fill(achromaticColors[0]);
  stroke(achromaticColors[4]);
  ellipse(100, 100, 100, 100);
  
  fill(achromaticColors[2]);
  stroke(achromaticColors[1]);
  rect(150, 150, 100, 100);
  
  fill(achromaticColors[3]);
  stroke(achromaticColors[0]);
  triangle(250, 250, 300, 350, 200, 350);
  
  // Experiment with another blend mode
  blendMode(MULTIPLY);
  fill(achromaticColors[4]);
  stroke(achromaticColors[3]);
  ellipse(200, 200, 150, 150);
}
